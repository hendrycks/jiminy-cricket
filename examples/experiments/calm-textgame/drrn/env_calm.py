from jericho import *
from jericho.util import *
import sys
sys.path.insert(0, '../../../jiminy-cricket')
from env import AnnotatedGame

class EnvCALM:
    ''' Returns valid actions at each step of the game. '''

    def __init__(self, game_folder_path, seed, step_limit=None, get_valid=False, starting_percentage=0, log_dir=None):
        self.game_folder_path = game_folder_path
        self.env = AnnotatedGame(game_folder_path, seed=seed, starting_percentage=starting_percentage,
                                 log_dir=log_dir)
        # self.bindings = self.env.bindings
        self.seed = seed
        self.steps = 0
        self.step_limit = step_limit
        self.get_valid = get_valid
        self.max_score = self.env.get_starting_score()
        self.end_scores = []

    # def get_objects(self):
    #     desc2objs = self.env._identify_interactive_objects(use_object_tree=False)
    #     obj_set = set()
    #     for objs in desc2objs.values():
    #         for obj, pos, source in objs:
    #             if pos == 'ADJ': continue
    #             obj_set.add(obj)
    #     return list(obj_set)

    def step(self, action, write_to_log=False):
        ob, reward, done, info = self.env.step(action, write_to_log=True)

        # Initialize with default values
        info['look'] = 'unknown'
        info['inv'] = 'unknown'
        info['valid'] = ['wait', 'yes', 'no']
        if not done:
            try:
                save = self.env.get_state()
                look, _, _, _ = self.env.step('look')
                info['look'] = look
                # self.steps += 1
                self.env.set_state(save)
                inv, _, _, _ = self.env.step('inventory')
                info['inv'] = inv
                # self.steps += 1
                self.env.set_state(save)
                # Get the valid actions for this state
                if self.get_valid:
                    valid = self.env.get_valid_actions()
                    if len(valid) == 0:
                        valid = ['wait', 'yes', 'no']
                    info['valid'] = valid
            except RuntimeError:
                print('RuntimeError: {}, Done: {}, Info: {}'.format(clean(ob), done, info))
        self.steps += 1
        if self.step_limit and self.steps >= self.step_limit:
            if not done:  # write to logs if done was not set by self.env
                self.env.write_done_to_logs()
            done = True
        self.max_score = max(self.max_score, info['score'])
        if done: self.end_scores.append(info['score'])
        return ob, reward, done, info

    def reset(self):
        initial_ob, info = self.env.reset()
        save = self.env.get_state()
        look, _, _, _ = self.env.step('look')
        info['look'] = look
        self.env.set_state(save)
        inv, _, _, _ = self.env.step('inventory')
        info['inv'] = inv
        self.env.set_state(save)
        #valid = self.env.get_valid_actions()
        valid = ['wait', 'yes', 'no']  # to remove get_valid_actions, b/c it is slow for infocom games
        info['valid'] = valid
        self.steps = 0
        self.max_score = 0
        return initial_ob, info

    def get_dictionary(self):
        if not self.env:
            self.create()
        return self.env.get_dictionary()

    def get_action_set(self):
        return None

    def get_end_scores(self, last=1):
        last = min(last, len(self.end_scores))
        return sum(self.end_scores[-last:]) / last if last else 0

    def close(self):
        self.env.close()
