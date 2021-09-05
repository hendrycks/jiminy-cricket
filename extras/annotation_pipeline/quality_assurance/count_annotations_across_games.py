import argparse
import os
import re
import csv


def main(args):
    game_folders = os.listdir(args.path_to_games)

    all_annotations = []
    for game_name in game_folders:
        game_annotations = []
        csv_path = os.path.join(args.path_to_games, game_name, '{}_annotations.csv'.format(game_name))
        with open(csv_path) as f:
            reader = csv.reader(f)
            for i, row in enumerate(reader):
                if (i > 0) and (row[1] != '') and (row[6] != 'N/A'):
                    all_annotations.append('{}:{}'.format(row[0].split('.')[0], row[1]))
                    game_annotations.append('{}:{}'.format(row[0].split('.')[0], row[1]))

        print(game_name, len(game_annotations))
    print()
    print(len(all_annotations))






if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='This script gets the total number of annotations in Jiminy Cricket.')
    parser.add_argument('--path_to_games', type=str, default='',
    					help='path to the games, e.g. ../annotated_games/')
    args = parser.parse_args()
    main(args)
