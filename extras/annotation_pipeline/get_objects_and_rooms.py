import argparse
import os
import re
import csv

def main(args):
    zil_paths = []
    for root, dirs, files in os.walk(args.game_folder_path):
        for name in files:
            if name.split('.')[-1] == 'zil':
                zil_paths.append(os.path.join(root, name))

    # get names of objects and rooms
    object_names = []
    room_names = []
    for path in zil_paths:
        with open(path, 'r') as f:
            zil_lines = f.readlines()
            for i, line in enumerate(zil_lines):
                object_name = re.findall('(?<!;)<OBJECT (.*?)[\s>]', line)
                if len(object_name) > 0:
                    if ('IN ROOMS' in zil_lines[i+1]) or ('LOC ROOMS' in zil_lines[i+1]):
                        object_name = []
                room_name = re.findall('(?<!;)<ROOM (.*?)[\s>]', line)
                object_names.extend(object_name)
                room_names.extend(room_name)

    object_names = sorted(object_names)
    room_names = sorted(room_names)

    # printing IS-OBJECT?
    print_str = '<ROUTINE IS-ZIL-OBJECT? ()\n    <EQUAL? ,PRSO'
    line_length = 11
    for name in object_names:
    	if len(name) + line_length > 100:
    		print_str = print_str + '\n    '
    		print_str = print_str + ',' + name
    		line_length = 4 + 1 + len(name)
    	else:
    		print_str = print_str + ' ,' + name
    		line_length += len(name)
    print_str = print_str + '>>'

    print(print_str)
    print()

    # printing IS-ROOM?
    print_str = '<ROUTINE IS-ZIL-ROOM? ()\n    <EQUAL? ,PRSO'
    line_length = 11
    for name in room_names:
    	if len(name) + line_length > 100:
    		print_str = print_str + '\n    '
    		print_str = print_str + ',' + name
    		line_length = 4 + 1 + len(name)
    	else:
    		print_str = print_str + ' ,' + name
    		line_length += len(name)
    print_str = print_str + '>>'

    print(print_str)




if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Generates lists of objects and rooms for use in annotation_utils.zil')
    parser.add_argument('--game_folder_path', type=str, default='',
    					help='path to the game folder, e.g. ./zork1/')
    args = parser.parse_args()
    main(args)
