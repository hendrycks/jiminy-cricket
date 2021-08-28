import argparse
import os
import shutil
import re
import csv
import pprint

pp = pprint.PrettyPrinter()


# This script looks for the full span of "if" statements inside <COND ... > statements in
# the zil files of a game. Then it reports if any annotations are on "if" statement lines


def check_cond_annotations(args, game_name, csv_path):
    # get list of annotations from CSV
    annotations = []
    with open(csv_path) as f:
        reader = csv.reader(f)
        for i, row in enumerate(reader):
            # discard the first row (header info) and rows between files (these typically have the second column empty)
            if (i > 0) and (row[1] != '') and (row[6] != 'N/A'):
                annotations.append({'index': i, 'filename': row[0], 'line_number': row[1]})

    # get list of paths to ZIL files for the indicated game
    zil_paths = []
    for root, dirs, files in os.walk(args.game_folder_path):
        for name in files:
            if name.split('.')[-1] == 'zil':
                zil_paths.append({'filename': name, 'full_path': os.path.join(root, name)})


    # For each ZIL file, find all <COND statements and...
    all_if_lines = []
    violations = []
    for path in zil_paths:
        print('Checking {}'.format(path['filename']))
        with open(path['full_path'], 'r') as f:
            zil_lines = f.readlines()

        cond_lines = []
        if_lines = []
        for i, line in enumerate(zil_lines):
            if '<COND' in line: # found one!
                cond_start_idx = i
                tmp = line.split('<COND')
                # assert len(tmp) == 2, 'Error! Did not expect two conds: {}, {}, {}'.format(path, i, line)
                if len(tmp) != 2:
                    print('Warning. Two conds on same line: {}, {}, {}'.format(path, i, line))
                cond_lines = []
                left_carets = 0
                right_carets = 0
                offset = 0
                done = False
                in_string = False
                next_line = '<COND' + ''.join(tmp[1:])  # add rest of line, even if it contains another cond
                while not done:
                    for j, char in enumerate(next_line):
                        prev_char = next_line[j - 1] if j > 0 else None
                        if char == '"' and prev_char != '\\':
                            in_string = not in_string
                        if in_string:
                            continue
                        if char == '<':
                            left_carets += 1
                        elif char == '>':
                            right_carets += 1
                        if left_carets == right_carets:
                            cond_lines.append(next_line[:j+1])
                            done = True
                            break
                    if not done:
                        cond_lines.append(next_line)
                        offset += 1
                        next_line = zil_lines[cond_start_idx + offset]

                cond_end_idx = cond_start_idx + offset

                left_parens = 0
                right_parens = 0
                in_string = False
                for j, line in enumerate(cond_lines):
                    for k, char in enumerate(line):
                        prev_char = line[k - 1] if k > 0 else None
                        if char == '"' and prev_char != '\\':
                            in_string = not in_string
                        if in_string:
                            continue
                        if char == '(':
                            left_parens += 1
                            if left_parens == right_parens + 1:
                                # we are now in an "if" statement
                                if line[k+1] == '<':
                                    # go into caret matching mode
                                    left_carets = 0
                                    right_carets = 0
                                    done = False
                                    offset = 0
                                    next_line = line[k+1:]
                                    if_start_idx = j
                                    in_string2 = False
                                    while not done:
                                        for m, char2 in enumerate(next_line):
                                            prev_char2 = line[k - 1] if k > 0 else None
                                            if char2 == '"' and prev_char2 != '\\':
                                                in_string2 = not in_string2
                                            if in_string2:
                                                continue
                                            if char2 == '<':
                                                left_carets += 1
                                            elif char2 == '>':
                                                right_carets += 1
                                            if left_carets == right_carets:
                                                done = True
                                                if_end_idx = j + offset
                                                break
                                        if not done:
                                            offset += 1
                                            next_line = cond_lines[j + offset]

                                    if_lines.append([cond_start_idx+if_start_idx, cond_start_idx+if_end_idx])
                                else:
                                    # assume the "if" statement is just on this line
                                    if_lines.append([cond_start_idx+j, cond_start_idx+j])
                        elif char == ')':
                            right_parens += 1

        for tmp in if_lines:
            all_if_lines.append([path['filename'], tmp])

        # find annotations that are inside "if" statements
        for annotation in annotations:
            if annotation['filename'] != path['filename']:
                continue  # annotation is from a different file than the one we're focusing on

            line_number = re.sub('\([a-z]\)', '', annotation['line_number'])  # transform "1312(a)", "1312(b)", etc. into "1312"
            line_number = int(line_number) - 1  # convert to 0-indexing
            for span in if_lines:
                if span[0] <= line_number <= span[1]:
                    violations.append([annotation, span, ''.join([zil_lines[i] for i in range(span[0], span[1]+1)])])


    print('\nFound {} "if" statements:\n'.format(len(all_if_lines)))
    # pp.pprint(all_if_lines)

    print('\nFound {} annotations in "if" statements:\n'.format(len(violations)))
    for violation in violations:
        print(violation[:2])
        print(violation[2])
        print()
    # pp.pprint(violations)


def main(args):
    assert os.path.isdir(args.game_folder_path), 'Source path {} is not a directory'.format(args.game_folder_path)
    game_name = os.path.basename(args.game_folder_path)
    assert len(game_name) > 0, 'Improper game_folder_path (try removing / at the end)'
    csv_path = os.path.join(args.game_folder_path, game_name + '_annotations.csv')
    assert os.path.exists(csv_path), 'Could not find {}'.format(csv_path)

    check_cond_annotations(args, game_name, csv_path)
    print('\nDone.\n')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Explore Jericho environments')
    parser.add_argument('--game_folder_path', default='../annotated_games/lurkinghorror', type=str,
                        help='path to directory of base game, with the unmodified annotation CSV in this directory,\
                              e.g. ./base_games/zork1  (NOTE: cannot have / at end)')
    args = parser.parse_args()
    main(args)
