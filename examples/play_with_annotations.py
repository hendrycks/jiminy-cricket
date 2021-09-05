import argparse
import numpy as np
from ..annotated_env import AnnotatedEnv

pp = pprint.PrettyPrinter()


def main(args):
    env = AnnotatedEnv(args.game_folder_path, seed=1)

    all_label_vectors = []
    total_reward = 0
    state_list = []
    all_actions = []

    observation, info = env.reset()
    print(observation)
    done = False


    if args.use_walkthrough:
        walkthrough_step = 0
        with open(args.walkthrough_path, 'r') as f:
            prev_actions = f.readlines()

    counter = 0
    while not done:
        if args.use_walkthrough:
            if walkthrough_step < len(prev_actions):
                action = prev_actions[walkthrough_step].rstrip('\n')
                print('Action{}: {}'.format(counter, action))
            else:
                action = input('Action{}: '.format(counter))
            walkthrough_step += 1
        else:
            action = input('Action: ')
        counter += 1

        # handle quitting override
        if action == 'quit1':
            done = True
            break

        # handle undo (currently doesn't undo annotations; this is just for getting walkthroughs)
        if (action == 'undo') and (len(state_list) > 0):
            env.set_state(state_list[-1])
            del state_list[-1]
            del all_actions[-1]
            print('Undone')
            print('_' * 80)
            continue

        # take a step
        observation, reward, done, info = env.step(action)
        annotations = info['markers']
        label_vectors = info['label_vectors']
        all_actions.append(action)

        # save state for undo functionality
        state_list.append(env.env.get_state())
        if len(state_list) > 20:
            del state_list[0]  # only keep last 20 states (in case of a memory issue)

        all_label_vectors.extend(label_vectors)
        total_reward += reward

        # print observations and annotations
        print(observation)
        print('_' * 80)
        print('DONE:', done)
        print('REWARD:', reward)
        print('ANNOTATIONS:')
        print(list(zip(annotations, label_vectors)))
        print('_' * 80)

    # print final statistics
    print('Game finished. Scored', info['score'], 'out of', env.get_max_score())

    print('All label vectors:')
    print(all_label_vectors)
    print('Cumulative label vector:')
    print(sum(all_label_vectors))

    print(env.state['reward_ids_seen'])


    if args.create_walkthrough:
        with open(args.walkthrough_path, 'w+') as f:
            for action in all_actions:
                f.write(action + '\n')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Explore the annotated games & create walkthroughs')
    parser.add_argument('--game_folder_path', type=str,
                        help='path to the folder containing the zcode and annotation CSV, e.g. ./annotated_games/zork1')
    parser.add_argument('--create_walkthrough', action='store_true',
                        help='Use this flag to create a walkthrough with your actions.\
                              You can use the "undo" action to go back if you mess something up.')
    parser.add_argument('--use_walkthrough', action='store_true',
                        help='use this flag if you want to use a pre-recorded walkthrough,\
                              with one action on each line of a text file')
    parser.add_argument('--walkthrough_path', type=str, default='',
                        help='path to the walkthrough file or desired save path for the walkthrough')
    args = parser.parse_args()
    main(args)
