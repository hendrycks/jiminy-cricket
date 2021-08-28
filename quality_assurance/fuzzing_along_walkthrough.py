
import argparse
import re
import csv
import pprint
import numpy as np
from jericho import FrotzEnv, TemplateActionGenerator
import pickle
import os

pp = pprint.PrettyPrinter()


def generate_rom_bindings(game_name):
    with open(args.syntax_file_path, 'r') as f:
        zil_lines = f.readlines()

    all_defs = []
    for i in range(len(zil_lines)):
        if i < args.starting_line:
            continue
        line = zil_lines[i].rstrip('\n').rstrip(' ')
        if line.startswith('<SYNTAX'):  # ingores syntax that was commented out
            if line.endswith('>'):
                all_defs.append(line)
            else:
                next_line = zil_lines[i+1].rstrip('\n')
                if next_line.endswith('>'):
                    all_defs.append(line + next_line)
                else:
                    next_next_line = zil_lines[i+2].rstrip('\n')
                    all_defs.append(line + next_line + next_next_line)
        if line.startswith('<VERB-SYNONYM'):
            all_defs.append(line)

    synonym_defs = []
    syntax_defs = []

    # strip outer stuff in definitions and separate into syntax and synonyms
    for line in all_defs:
        syntax = re.findall('<SYNTAX (.+?)\s=', line)
        synonym = re.findall('<VERB-SYNONYM (.+?)>', line)
        assert (len(syntax) + len(synonym)) == 1, line
        syntax_defs.extend(syntax)
        synonym_defs.extend(synonym)

    # remove FIND syntax to bring closer to Jericho--plus, we don't really need it for fuzzing
    for i in range(len(syntax_defs)):
        syntax_defs[i] = re.sub('\s(\(.+?\))', '', syntax_defs[i])
        syntax_defs[i] = re.sub('\s+', ' ', syntax_defs[i])

    # remove commented out synonyms
    for i in range(len(synonym_defs)):
        synonym_defs[i] = re.sub('\s+', ' ', synonym_defs[i])
        synonym_defs[i] = re.sub('( ;.+)', '', synonym_defs[i])

    # for line in synonym_defs:
    #     print(line)
    # print()
    # for line in syntax_defs:
    #     print(line)

    # convert to format for Jericho fuzzing (for now, don't incorporate synonyms)
    for i in range(len(syntax_defs)):
        syntax_defs[i] = syntax_defs[i].lower()
        syntax_defs[i] = re.sub('object', 'OBJ', syntax_defs[i])

    # for line in synonym_defs:
    #     print(line)
    # print()
    # for line in syntax_defs:
    #     print(line)

    name = game_name
    rom = game_name + '.zil'
    seed = 1
    grammar = ';'.join(syntax_defs)
    max_word_length = 6

    rom_bindings = {'name': name, 'rom': rom, 'seed': seed, 'grammar': grammar, 'max_word_length': max_word_length}

    return rom_bindings

def remove_status_line(observation):
    return re.sub('.+Score: .+Moves: .+\n', '', observation)

def find_markers(observation):
        # parse out markers and remove from observation
        markers = re.findall('\[ID: (.*?), PRSO: (.*?), PRSI: (.*?)\]', observation)
        if len(markers) > 0:
            observation = re.sub('\[ID: .*?, PRSO: .*?, PRSI: .*?\]', '', observation)
        else:
            markers = re.findall('\[ID: (.*?)\]', observation)  # superset of first pattern, but it should only fire on raw annotations
            markers = [(tmp,) for tmp in markers]  # put each marker in singleton tuple for consistency with if case
            observation = re.sub('\[ID: .*?\]', '', observation)

        return observation, markers

def verbs_go_last(annotations):
    """
    If 2 annotations exist and 1 is from verbs.zil, keep the other
    """
    if len(annotations) == 2:
        fname1 = annotations[0][0].split(':')[0]
        fname2 = annotations[1][0].split(':')[0]

        if ((fname1 == 'verbs') and (fname2 != 'verbs')) or ((fname1 != 'verbs') or (fname2 == 'verbs')):
            if fname1 != 'verbs':
                new_annotations = [annotations[0]]
            else:
                new_annotations = [annotations[1]]
            return new_annotations
        else:
            return annotations
    else:
        return annotations

def get_candidate_actions(env, act_gen):
    interactive_objs  = env._identify_interactive_objects(use_object_tree=False)
    interactive_objs['me'] = [('me', 'NOUN', 'LOC')]
    best_obj_names    = env._score_object_names(interactive_objs)
    candidate_actions = act_gen.generate_actions(best_obj_names)

    new_candidate_actions = []
    for action in candidate_actions:
        if (' all ' in action) or action.endswith('all'):
            continue
        else:
            new_candidate_actions.append(action)
    candidate_actions = new_candidate_actions

    return candidate_actions


def main(args):
    # get the name of the game, from which we generate the zcode and walkthrough paths
    game_name = os.path.basename(args.game_folder)
    assert len(game_name) > 0, 'Improper game_folder (try removing / at the end)'
    zcode_path = os.path.join(args.game_folder, game_name + '.z3')
    walkthrough_path = os.path.join(args.game_folder, game_name + '_walkthrough.txt')

    # create counter for annotations; keeps track of how many times we see 0, 1, 2, ... annotations
    all_annotation_hist = np.zeros(15, dtype=np.int)  # max out at 15 annotations; if more than this, an error will occur
    annotation_hist = np.zeros(15, dtype=np.int)
    duplicate_scenarios = []

    env = FrotzEnv(zcode_path)
    rom_bindings = generate_rom_bindings(game_name)
    act_gen = TemplateActionGenerator(rom_bindings)
    env.seed(1)  # walkthrough seed
    observation, info = env.reset()
    done = False

    step = 0
    with open(walkthrough_path, 'r') as f:
        walkthrough_actions = f.readlines()

    while not done:
        # if step == 50:  # don't make it too big
        #     break
        # semi-random actions
        candidate_actions = get_candidate_actions(env, act_gen)
        for i, action in enumerate(candidate_actions):
            if i % 1000 == 0:
                print('{} / {}'.format(i, len(candidate_actions)))
            saved_state = env.get_state()
            observation, _, _, _ = env.step(action)
            env.set_state(saved_state)
            observation = remove_status_line(observation)
            observation, annotations = find_markers(observation)
            annotations = verbs_go_last(annotations)
            annotation_hist[len(annotations)] += 1
            if len(annotations) > 1:
                duplicate_scenarios.append([step, action, observation, annotations])

        # print histogram of annotation counts
        print('\nAnnotation histogram from previous step')
        print(annotation_hist)
        all_annotation_hist += annotation_hist
        annotation_hist = np.zeros(15, dtype=np.int)

        # move to next step along walkthrough
        action = walkthrough_actions[step].rstrip('\n')
        observation, reward, done, info = env.step(action)
        step += 1

        print('\nWalkthrough Step:', step)

        observation_orig = observation
        observation = remove_status_line(observation)
        observation, annotations = find_markers(observation)
        print('_'*80)
        print('Action:', action)
        print(observation_orig)
        print('_'*80)
        annotations = verbs_go_last(annotations)
        annotation_hist[len(annotations)] += 1
        if len(annotations) > 1:
            duplicate_scenarios.append(['walkthrough_step', step, action, observation, annotations])


    print()
    print()
    print(all_annotation_hist)

    with open('duplicate_scenarios.pkl', 'wb+') as f:
        pickle.dump(duplicate_scenarios, f)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Explore Jericho environments')
    parser.add_argument('--game_folder', type=str,
                        help='path to the game folder, e.g. ./zork1/')
    parser.add_argument('--syntax_file_path', type=str,
                        help='path to syntax.zil')
    parser.add_argument('--starting_line', type=int,
                        help='line from which to start parsing syntax.zil')
    args = parser.parse_args()
    main(args)
