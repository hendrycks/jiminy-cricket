import os
import time
import jericho
import logger
import argparse
import logging
import json
import subprocess
from jericho.util import clean
from random import choice
from collections import defaultdict
import numpy as np
import pickle

from env_calm import EnvCALM

from lm import *
from drrn import *
from conditioning_model import EthicsModel

logging.getLogger().setLevel(logging.CRITICAL)
# subprocess.run("python -m spacy download en_core_web_sm".split())


def configure_logger(log_dir, add_tb=1, add_wb=1, args=None):
	logger.configure(log_dir, format_strs=['log'])
	global tb
	log_types = [logger.make_output_format('json', log_dir),
				 logger.make_output_format('stdout', log_dir)]
	if add_tb: log_types += [logger.make_output_format('tensorboard', log_dir)]
	if add_wb: log_types += [logger.make_output_format('wandb', log_dir, args=args)]
	tb = logger.Logger(log_dir, log_types)
	global log
	log = logger.log


def train(walkthrough_actions, lm, envs, update_freq, eval_freq, checkpoint_freq, log_freq, args, cclm):
	start = time.time()
	cumulative_morality_vector = np.zeros(4, dtype=np.int)
	obs, rewards, dones, infos, transitions = [], [], [], [], []
	env_steps, max_score, d_in, d_out = 0, 0, defaultdict(list), defaultdict(list)
	for env in envs:
		ob, info = env.reset()
		obs, rewards, dones, infos, transitions = \
			obs + [ob], rewards + [0], dones + [False], infos + [info], transitions + [[]]
	states = build_state(lm, obs, infos, envs)
	valid_acts = [info['valid'] for info in infos]
	valid_ids_tokenized = [[lm.act2ids(a) for a in info['valid']] for info in infos]

	for act_num, walkthrough_action in enumerate(walkthrough_actions):
		walkthrough_action = walkthrough_action.lower()  # bc some actions are still uppercase at time of this experiment; we should fix this in the walkthrough text files
		step = act_num + 1

		#### INFIDEL ###  # TODO: Why is this here?
		valid_acts[0] = [act for act in valid_acts[0] if act not in ['enter river', 'swim', 'enter water','dive']]
		#################

		# act
		action_strs = [walkthrough_action]
		valid_acts[0].append(walkthrough_action)  # add walkthrough action to list of valid actions
		valid_ids_tokenized[0].append(lm.act2ids(walkthrough_action))

		cond_probs = cclm.get_probs(states, valid_acts, cond_threshold=None)
		# cond_probs_w_obs = cclm.get_probs_w_obs(states, valid_acts)
		# lm_logprobs = [lm.score(state.obs, act_ids) for state, act_ids in zip(states, valid_ids_tokenized)]

		log('State  {}: {}'.format(step, lm.tokenizer.decode(states[0].state)))
		
		next_obs, next_ob_hashes = [],[]

		action_choices_label_vectors = []
		action_choices_markers = []
		for i, env in enumerate([envs[0]]):  # only 1 env for these experiments
			for j, lm_action in enumerate(valid_acts[i]):
				saved_state = env.env.get_state()
				ob, reward, done, info = env.env.step(lm_action)
				env.env.set_state(saved_state)
				markers, label_vectors = info['markers'], info['label_vectors']
				next_obs.append(ob)
				next_ob_hashes.append(hash(ob))
				if i == 0:
					log('>> Action{}_{}: {}'.format(step, j, lm_action))
					log("Reward{}_{}: {}, Score {}, Done {}, Markers: {}, Label_vectors: {}".format(step, j, reward, info['score'], done, markers, label_vectors))
					action_choices_label_vectors.append(label_vectors)
					action_choices_markers.append(markers)

		# cond_probs_w_next_obs = cclm.get_probs_w_next_obs(next_obs, [[act] for act in valid_acts[0]])

		log('Actions{}: {}'.format(step, infos[0]['valid']))
		log('CondProbs{}: {}'.format(step, [round(value, 2) for value in cond_probs[0].tolist()]))
		envs[0].env._write_to_log([round(value, 2) for value in cond_probs[0].tolist()], 'cond_probs_log.txt')
		envs[0].env._write_to_log(valid_acts[0], 'action_choices_log.txt')
		envs[0].env._write_to_log(action_choices_label_vectors, 'action_choices_label_vectors_log.txt')
		envs[0].env._write_to_log(action_choices_markers, 'action_choices_markers_log.txt')
		
		# log('CondProbsWObs{}: {}'.format(step, [round(value, 2) for value in cond_probs_w_obs[0].tolist()]))
		# log('CondProbsWNextObs{}: {}'.format(step, [round(value, 2) for value in [act.item() for act in cond_probs_w_next_obs]]))
		# log('LmLogprobs{}: {}'.format(step, [round(value, 2) for value in lm_logprobs[0]]))

		dup_actions = np.where(np.array(next_ob_hashes) == next_ob_hashes[-1])[0]
		log('Dup actions{}: {}\n\n'.format(step, dup_actions.tolist()))
		envs[0].env._write_to_log(dup_actions.tolist(), 'dup_actions_log.txt')

		# step with rejection
		next_obs, next_rewards, next_dones, next_infos = [], [], [], []
		for i, (env, action) in enumerate(zip(envs, action_strs)):
			if dones[i]:
				raise ValueError('we should not get here')
			ob, reward, done, info = env.step(action)
			markers, label_vectors = info['markers'], info['label_vectors']
			for vec in label_vectors:
				cumulative_morality_vector += vec

			next_obs, next_rewards, next_dones, next_infos = \
				next_obs + [ob], next_rewards + [reward], next_dones + [done], next_infos + [info]
		
		rewards, dones, infos = next_rewards, next_dones, next_infos

		# ================= GENERATE VALID ACTIONS ================= #
		next_states = build_state(lm, next_obs, infos, envs, prev_obs=obs, prev_acts=action_strs)
		if args.lm_top_k:
			for env, info, state, done in zip(envs, infos, next_states, dones):
				if not done:
					key = hash(tuple(state[0] + state[1] + state[2]))
					if args.lm_type == 'ngram':
						objs = env.get_objects()
						actions = lm.generate(objs, k=args.lm_top_k).copy()
					else:
						actions = lm.generate(state.state, k=args.lm_top_k)
						l_in, l_out = d_in[key], d_out[key]
						actions += [action for action in l_in if action not in actions]  # add extra valid
						actions = [action for action in actions if action and action not in l_out]  # remove invalid
					if not actions: actions = ['wait', 'yes', 'no']
					info['valid'] = actions
		next_valids = [info['valid'] for info in infos]
		next_valids_tokenized = [[lm.act2ids(a) for a in info['valid']] for info in infos]
		# ========================================================== #

		obs, states, valid_acts, valid_ids_tokenized = next_obs, next_states, next_valids, next_valids_tokenized
	
	
	envs[0].env._write_to_log('<!DONE!>', 'cond_probs_log.txt')
	envs[0].env._write_to_log('<!DONE!>', 'action_choices_log.txt')
	envs[0].env._write_to_log('<!DONE!>', 'dup_actions_log.txt')

	print('TOTAL TIME ELAPSED:', time.time() - start)


def parse_args():
	parser = argparse.ArgumentParser()
	parser.add_argument('--output_dir', default='./logs/model')
	parser.add_argument('--load_dir', default=None, type=str)
	parser.add_argument('--env_step_limit', default=100, type=int)
	parser.add_argument('--seed', default=None, type=int)
	parser.add_argument('--num_envs', default=8, type=int)
	parser.add_argument('--update_freq', default=1, type=int)
	parser.add_argument('--save_freq', default=10000, type=int)
	parser.add_argument('--checkpoint_freq', default=1000, type=int)
	parser.add_argument('--eval_freq', default=5000, type=int)
	parser.add_argument('--log_freq', default=100, type=int)
	parser.add_argument('--memory_size', default=10000, type=int)
	parser.add_argument('--priority_fraction', default=0.5, type=float)
	parser.add_argument('--batch_size', default=64, type=int)
	parser.add_argument('--gamma', default=.9, type=float)
	parser.add_argument('--learning_rate', default=0.0001, type=float)
	parser.add_argument('--clip', default=5, type=float)
	parser.add_argument('--embedding_dim', default=128, type=int)
	parser.add_argument('--hidden_dim', default=128, type=int)

	# logger
	parser.add_argument('--tensorboard', default=0, type=int)
	parser.add_argument('--wandb', default=0, type=int)
	parser.add_argument('--wandb_project', default='textgame', type=str)

	# language model
	parser.add_argument('--lm_top_k', default=30, type=int,
						help='when >0, use lm top-k actions in place of jericho action detection')
	parser.add_argument('--lm_type', default='gpt', help='gpt | ngram')
	parser.add_argument('--lm_path', default='gpt2')
	parser.add_argument('--lm_dict', default='')
	parser.add_argument('--fp16', action='store_true')
	parser.add_argument('--lm_batch_size', default=None, type=int, help='batch size for CALM action generator; defaults to all envs at once')
	parser.add_argument('--model_parallel', action='store_true')

	# conditioning
	parser.add_argument('--cclm_path', default=None, type=str)
	parser.add_argument('--cclm_model', default='roberta-large', type=str)
	parser.add_argument('--conditioning_model_load_dir', default=None, type=str)
	parser.add_argument('--reward_shaping', action='store_true')
	parser.add_argument('--policy_shaping', action='store_true')
	parser.add_argument('--condition_weight', default=0, type=float)
	parser.add_argument('--cond_threshold', default=0.5, type=float)
	parser.add_argument('--weight_conditioning_by_max_score', action='store_true')

	# annotation
	parser.add_argument('--game_folder_path', type=str)

	# fast-forwarding
	parser.add_argument('--starting_percentage', type=int, default=0)

	parser.add_argument('--walkthrough_path', type=str)

	# exploration
	parser.add_argument('--eps', default=None, type=float,
						help='None: ~ softmax act_value; else eps-greedy-exploration')
	parser.add_argument('--eps_top_k', default=-1, type=int,
						help='-1: uniform exploration; 0: ~ softmax lm_value; >0: ~ uniform(top k w.r.t. lm_value)')
	parser.add_argument('--alpha', default=0, type=float,
						help='act_value = alpha * bert_value + (1-alpha) * q_value; only used when eps is None now')
	parser.add_argument('--argmax', action='store_true')

	return parser.parse_args()


def main():
	start_time = time.time()
		
	assert jericho.__version__.startswith('3'), "This code is designed to be run with Jericho version >= 3.0.0."
	args = parse_args()
	os.makedirs(args.output_dir, exist_ok=False)

	print('==============================================')
	print('============== RUNNING TRAINING FOR {} ==============\n'.format(args.game_folder_path))

	if args.reward_shaping:
		assert (not args.policy_shaping) and (args.cclm_path is not None)
		print(f'---> REWARD SHAPING with {args.cclm_path}')
	elif args.policy_shaping:
		assert not args.reward_shaping and (args.cclm_path is not None)
		print(f'---> POLICY SHAPING with {args.cclm_path}')
	else:
		assert (args.condition_weight == 0) and (args.cclm_path is None)
		print('---> UNCONDITIONED')

	if args.conditioning_model_load_dir:
		print(f'LOADING CONDITIONING MODEL FROM {args.conditioning_model_load_dir}')

	lm = GPT2LM(args.lm_path, args.fp16, model_parallel=args.model_parallel)
	args.vocab_size = len(lm.tokenizer)
	
	print(args)
	print()

	if args.cclm_path:
		cclm = EthicsModel(args.cclm_model, args.cclm_path, args.conditioning_model_load_dir or args.load_dir)
	else:
		cclm = None

	configure_logger(args.output_dir, args.tensorboard, args.wandb, args)

	# =========================== CREATE ENVS =========================== #
	envs = [EnvCALM(game_folder_path=args.game_folder_path, step_limit=1e5, seed=1,
					starting_percentage=0,
					log_dir=os.path.join(args.output_dir, 'log_files', 'env{}'.format(i)))
			for i in range(args.num_envs)]

	# =========================== START TRAINING =========================== #
	print('MAX SCORE FOR GAME: {}'.format(envs[0].env.get_max_score()))
	print('STARTING SCORE: {}'.format(envs[0].env.get_starting_score()))

	print('\n==============================================\n')

	with open(os.path.join(args.game_folder_path, envs[0].env.game_name + '_walkthrough.txt'), 'r') as f:
		walkthrough_actions = f.readlines()

	train(walkthrough_actions, lm, envs, args.update_freq, args.eval_freq,
		  args.checkpoint_freq, args.log_freq, args, cclm)

	with open(os.path.join(args.output_dir, 'experiment_info.pkl'), 'wb') as f:
		pickle.dump({'status': 'Done', 'time': time.time() - start_time}, f)


if __name__ == "__main__":
	main()
