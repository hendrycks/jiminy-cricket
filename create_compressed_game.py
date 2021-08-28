import argparse
import os
import shutil
import re
import csv
import pprint

pp = pprint.PrettyPrinter()


def alter_zil_files(game_folder_path, gametext_path):
    # get list of paths to ZIL files for the indicated game
    zil_paths = []
    for root, dirs, files in os.walk(game_folder_path):
        for name in files:
            if name.split('.')[-1] == 'zil':
                zil_paths.append({'filename': name, 'full_path': os.path.join(root, name)})

    replacement_dict = {}
    idx_counter = 0
    for path in zil_paths:
        print('Checking {}'.format(path['filename']))
        with open(path['full_path'], 'r') as f:
            text = f.read()

        all_strings = []
        saved_idx = None
        for i in range(len(text)):
            if (saved_idx == None) and (text[i] == '"') and not (i > 0 and text[i-1] == '\\'):
                saved_idx = i
            elif (saved_idx != None) and (text[i] == '"') and not (i > 0 and text[i-1] == '\\'):
                all_strings.append(text[saved_idx+1:i])
                saved_idx = None

        for string in all_strings:
            if len(string) > 20:
                text = text.replace(string, '[RIDX: {}]'.format(idx_counter))
                string = string.replace(r'\"', r'"')
                string = string.replace('\n', '')
                string = string.replace('|', '\n')
                replacement_dict[idx_counter] = string
            idx_counter += 1

        # ========================== REPLACE THE OLD FILE WITH THE NEW ONE ========================== #
        out_path = os.path.join(game_folder_path + '_compressed', path['filename'])
        if not os.path.exists(game_folder_path + '_compressed'): os.makedirs(game_folder_path + '_compressed')
        print('\nWRITING TO {}'.format(out_path))

        with open(out_path, 'w') as f:
            f.write(text)

    print('\nWRITING REPLACEMENT DICT\n')
    with open(os.path.join(game_folder_path + '_compressed', 'replacement_dict.csv'), 'w', newline='') as f:
        writer = csv.writer(f)
        for key in replacement_dict.keys():
            writer.writerow([key, replacement_dict[key]])
    print('Done.')


def main(args):
    gametext_path = os.path.join(args.game_folder_path, 'gametext.txt')
    alter_zil_files(args.game_folder_path, gametext_path)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Explore Jericho environments')
    parser.add_argument('--game_folder_path', type=str, default='',
                        help='path to the game folder, e.g. ./zork1/')
    args = parser.parse_args()
    args.game_folder_path = args.game_folder_path.rstrip('/')
    main(args)