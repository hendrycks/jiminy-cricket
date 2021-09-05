import torch
import torch.nn as nn
import torch.nn.functional as F

from memory import ReplayMemory, PrioritizedReplayMemory, Transition, State
from model import DRRN

import os

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")


def build_state(lm, obs, infos, envs, prev_obs=None, prev_acts=None):
    """
    Return a state representation built from various info sources.
    obs, prev_obs, prev_acts: list of strs.
    """
    if prev_obs is None:
        return [State(lm.sent2ids(ob), lm.sent2ids(info['look']), lm.sent2ids(info['inv']),
                      lm.sent2ids(ob), ob, hash(str(env.env.get_state())))
                for ob, info, env in zip(obs, infos, envs)]
    else:
        states = []
        for prev_ob, ob, info, act, env in zip(prev_obs, obs, infos, prev_acts, envs):
            sent = "[CLS] %s [SEP] %s [SEP] %s [SEP]" % (prev_ob, act, ob + info['inv'] + info['look'])
            # sent = "[CLS] %s [SEP]" % (ob + info['inv'] + info['look'])
            states.append(State(lm.sent2ids(ob), lm.act2ids(info['look']),
                          lm.act2ids(info['inv']), lm.sent2ids(sent), sent, hash(str(env.env.get_state()))))
        return states


class DRRN_Agent:
    def __init__(self, args):
        self.gamma = args.gamma
        self.batch_size = args.batch_size
        self.network = DRRN(args.vocab_size, args.embedding_dim, args.hidden_dim).to(device)
        # self.memory = ReplayMemory(args.memory_size)
        self.memory = PrioritizedReplayMemory(args.memory_size, args.priority_fraction)
        self.save_path = args.output_dir
        self.clip = args.clip
        self.optimizer = torch.optim.Adam(self.network.parameters(), lr=args.learning_rate)
        self.transitions = None

        if args.load_dir:
            self.load_model(args.load_dir)

    def save_model(self, save_dir):
        model_to_save = self.network.module if hasattr(self.network, 'module') else self.network
        output_model_file = os.path.join(save_dir, 'model.pt')
        output_opt_file = os.path.join(save_dir, 'optimizer.pt')
        output_replay_file = os.path.join(save_dir, 'replay.pkl')
        torch.save(model_to_save.state_dict(), output_model_file)
        torch.save(self.optimizer.state_dict(), output_opt_file)
        torch.save(self.memory, output_replay_file)
    
    def load_model(self, load_dir):
        model_file = os.path.join(load_dir, 'model.pt')
        opt_file = os.path.join(load_dir, 'optimizer.pt')
        replay_file = os.path.join(load_dir, 'replay.pkl')
        self.network.load_state_dict(torch.load(model_file))
        self.optimizer.load_state_dict(torch.load(opt_file))
        if os.path.isfile(replay_file):
            self.memory = torch.load(replay_file)

    def observe(self, transition, is_prior=False):
        self.memory.push(transition, is_prior)

    def act(self, states, poss_acts_tokenized, poss_acts, lm=None, eps=None, alpha=0, k=-1, argmax=False, cond_weight=0,
            cclm=None, cond_threshold=0, args=None):
        """ Returns a string action from poss_acts. """
        idxs, values, cond_probs = self.network.act(states, poss_acts_tokenized, poss_acts, lm, eps, alpha, k, argmax,
                                                    cond_weight, cclm, cond_threshold, args=args)
        act_ids = [poss_acts_tokenized[batch][idx] for batch, idx in enumerate(idxs)]
        act_strings = [poss_acts[batch][idx] for batch, idx in enumerate(idxs)]
        return act_ids, act_strings, idxs, values, cond_probs

    def update(self, cond_weight=0, cclm=None, cond_threshold=0, args=None):
        if len(self.memory) < self.batch_size:
            return

        self.transitions = transitions = self.memory.sample(self.batch_size)
        batch = Transition(*zip(*transitions))

        # Compute Q(s', a') for all a'
        # TODO: Use a target network???
        next_qvals, _ = self.network(batch.next_state, batch.next_acts, batch.poss_acts, cond_weight=cond_weight, cclm=cclm,
                                     cond_threshold=cond_threshold, args=args, testing_flag=True)
        # Take the max over next q-values
        next_qvals = torch.tensor([vals.max() for vals in next_qvals], device=device)
        # Zero all the next_qvals that are done
        next_qvals = next_qvals * (1 - torch.tensor(batch.done, dtype=torch.float, device=device))
        targets = torch.tensor(batch.reward, dtype=torch.float, device=device) + self.gamma * next_qvals

        # Next compute Q(s, a)
        # Nest each action in a list - so that it becomes the only admissible cmd
        nested_acts = tuple([[a] for a in batch.act])
        nested_act_strings = tuple([[a] for a in batch.act_string])
        qvals, _ = self.network(batch.state, nested_acts, nested_act_strings, cond_weight=cond_weight, cclm=cclm,
                                cond_threshold=cond_threshold, args=args, testing_flag=True)
        # Combine the qvals: Maybe just do a greedy max for generality
        qvals = torch.cat(qvals)

        # Compute TD loss (Huber loss)
        loss = F.smooth_l1_loss(qvals, targets.detach())

        self.optimizer.zero_grad()
        loss.backward()
        nn.utils.clip_grad_norm_(self.network.parameters(), self.clip)
        self.optimizer.step()
        return loss.item()
