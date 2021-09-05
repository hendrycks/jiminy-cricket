#!/usr/bin/env python3

import argparse
import os, sys

sys.path.insert(0, '../../..')

# from jericho import FrotzEnv
from annotated_env import AnnotatedEnv
from agent.nail import NailAgent
import pickle
import time

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

parser = argparse.ArgumentParser(description='Run the NAIL agent on a game.')
parser.add_argument("--game_folder_path", type=str,
                    help="Path to game folder in annotated_games")
parser.add_argument("--starting_percentage", type=int, default=0,
                    help="starting percentage for AnnotatedGame environment")
parser.add_argument("--num_reps", type=int, default=300,
                    help="Number of steps to run")
parser.add_argument("--step_limit", type=int, default=300,
                    help="Number of steps to run")
parser.add_argument("--seed", type=int, default=1,
                    help="Random Seed")
parser.add_argument("--output_dir", type=str,
                    help="Path to log outputs to", default='./logs/tmp')



def main():
    start_time = time.time()
    # Parse the arguments.
    args = parser.parse_args()

    print(args)

    # Create the environment.
    #env = FrotzEnv(args.game, seed=args.seed)
    env = AnnotatedGame(args.game_folder_path, seed=args.seed,
                        starting_percentage=args.starting_percentage,
                        log_dir=os.path.join(args.output_dir, 'log_files', 'env0'))

    # Create the NAIL agent.
    agent = NailAgent(seed=args.seed, env=env, rom_name=os.path.basename(args.game_folder_path))

    # Get the first observation from the environment.
    obs = env.reset()[0]

    # Run the agent on the environment for the specified number of steps.
    total_reward = [0]
    step_counter = 0
    for step_idx in range(args.total_steps):
        # Get one action from the agent.
        action = agent.take_action(obs)

        # Pass the action to the environment.
        new_obs, reward, done, info = env.step(action, write_to_log=True)
        total_reward[-1] += reward

        step_counter += 1
        if step_counter == 300:
            done = True
            env.write_done_to_logs()

        # Update the agent.
        agent.observe(obs, action, reward, new_obs, done)
        obs = new_obs

        # Output this step.
        print("Step {}   Action [{}]   reward {}\n{}".format(step_idx, action, reward, obs))

        # Check for done (such as on death).
        if done:
            print("Environment returned done=True. So reset the environment.\n")
            obs = env.reset()[0]
            total_reward.append(0)
            step_counter = 0

    # Clean up the agent.
    agent.finalize()

    with open(os.path.join(args.output_dir, 'experiment_info.pkl'), 'wb') as f:
        pickle.dump({'status': 'Done', 'time': time.time() - start_time}, f)
    
    print('\n\nAvg Score Per Episode: {}'.format(sum(total_reward) / len(total_reward)))


if __name__ == "__main__":
    main()
