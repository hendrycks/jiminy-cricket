import torch
import numpy as np
from transformers import AutoTokenizer, AutoModelForSequenceClassification, AutoConfig

import os
import pickle

DIRECTIONS = ['north', 'south', 'east', 'west', 'northwest', 'northeast', 'southwest', 'southeast', 'down', 'up', 'in', 'out']

class EthicsModel:

    def __init__(self, model, load_path, load_dir, oracle=False):
        config = AutoConfig.from_pretrained(model, num_labels=1)
        self.device = torch.device("cuda")

        self.tokenizer = AutoTokenizer.from_pretrained(model)
        self.cclm = AutoModelForSequenceClassification.from_pretrained(model, config=config)

        self.oracle = oracle  # True if using oracle to know whether action is immoral
        self.envs = None  # initialize envs attribute for oracle

        if 'cm' in load_path:
            self.morality_mode = 'cm'
        elif 'util' in load_path:
            self.morality_mode = 'util'
        else:
            raise NotImplementedError

        # Use strict=False since the provided models were originally trained with an earlier version of Huggingface
        self.cclm.load_state_dict(torch.load(load_path), strict=False)  
        self.cclm = self.cclm.to(self.device)
        # model = torch.nn.DataParallel(model, device_ids=[i for i in range(ngpus)])
        self.cclm.eval()
        
        self.cache = {}
        if load_dir:
            self.load_cache(load_dir)

    def save_cache(self, save_dir):
        for action in self.cache:
            self.cache[action] = self.cache[action].detach().cpu()
        with open(os.path.join(save_dir, 'ethics_model.pkl'), 'wb') as f:
            pickle.dump(self.cache, f)

    def load_cache(self, load_dir):
        cache_file = os.path.join(load_dir, 'ethics_model.pkl')
        if os.path.exists(cache_file):
            print('LOADING CONDITIONING MODEL CACHE')
            with open(cache_file, 'rb') as f:
                self.cache = pickle.load(f)
            for action in self.cache:
                self.cache[action] = torch.tensor(self.cache[action], device=self.device)
        
    def get_ids_mask(self, sentences, max_length):
        tokenized = [self.tokenizer.tokenize(s) for s in sentences]
        tokenized = [t[-(max_length - 1):] + ['SEP'] for t in tokenized]

        ids = [self.tokenizer.convert_tokens_to_ids(t) for t in tokenized]
        ids = np.array([np.pad(i, (0, max_length - len(i)),
                            mode='constant') for i in ids])
        amasks = []
        for seq in ids:
            seq_mask = [float(i > 0) for i in seq]
            amasks.append(seq_mask)
        return ids, amasks

    def load_process_sentences(self, sentences, max_length=512):
        sentences = ["[CLS] " + s for s in sentences]
        ids, amasks = self.get_ids_mask(sentences, max_length)
        inputs = torch.tensor(ids, device=self.device)
        masks = torch.tensor(amasks, device=self.device)
        return inputs, masks

    @torch.no_grad()
    def get_probs(self, state_batch, act_batch, cond_threshold, testing_flag=False, custom_envs=None):
        
        # ACTION ONLY CONDITIONING
        act_sizes = [len(a) for a in act_batch]
        
        sentences = []
        sentences_raw_actions = []
        cond_probs = []
        for env_idx, actions in enumerate(act_batch):
            for action in actions:
                if self.oracle:
                    # in the oracle case, the output depends on the action and the env state, not just on
                    # the action string
                    cache_str = action + str(state_batch[env_idx].env_hash)
                else:
                    cache_str = action
                
                if cache_str in self.cache:
                    cond_probs.append(self.cache[cache_str])
                else:
                    cond_probs.append(cache_str)  # hacky way to remember what to add to the cache later
                    if testing_flag and self.oracle:
                        print('should not get here in update method; caching is imperfect')
                    sentences_raw_actions.append((action, env_idx))  # env_idx should be valid (e.g. < 8) when oracle is turned on
                    if action in DIRECTIONS:
                        action = 'go ' + action
                    sentences.append(f'I {action}.')
            
        if sentences:
            if self.oracle:
                probs = []
                assert self.envs != None, 'must set cclm.envs before using oracle'
                for action, env_idx in sentences_raw_actions:
                    if custom_envs is not None:
                        env = custom_envs[env_idx]
                    else:
                        env = self.envs[env_idx]
                    saved_state = env.env.get_state()
                    _, _, _, info = env.env.step(action)
                    if (info['label_vectors'] != []) and (sum(info['label_vectors'])[0] > 0):
                        probs.append(1)
                    else:
                        probs.append(0)
                    env.env.set_state(saved_state)
                probs = torch.FloatTensor(probs).to(self.device)
            else:
                input_ids, input_mask = self.load_process_sentences(sentences, 10)
                with torch.no_grad():
                    output = self.cclm(input_ids, attention_mask=input_mask)[0]
                if self.morality_mode == 'cm':
                    probs = torch.sigmoid(output).squeeze(dim=1)
                elif self.morality_mode == 'util':
                    probs = output.squeeze(dim=1)

        counter = 0
        for i, item in enumerate(cond_probs):
            if type(item) == str:
                prob = probs[counter]
                self.cache[item] = prob
                cond_probs[i] = prob
                counter += 1
        cond_probs = torch.tensor(cond_probs, device=self.device)
        
        if cond_threshold:
            if self.morality_mode == 'cm':
                cond_probs = cond_probs > cond_threshold
            elif self.morality_mode == 'util':
                cond_probs = cond_probs < cond_threshold
        return cond_probs.split(act_sizes)
