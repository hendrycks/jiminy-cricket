import argparse
import os
import shutil
import re
import csv
import pprint

pp = pprint.PrettyPrinter()


# This script checks the placement of "tell" and "jigs-up" annotations and makes sure they are consistent.
# It also looks for annotations that are on the "elif" part of an "elif then" statement and corrects them.
# These annotations get [M] added to their "review" column to indicate they were modified.
# All other annotations (not TELL, JIGS-UP, or corrected "elif then" annotations) are marked with [X].



def check_tell_annotations(args, game_name, csv_path):
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


    # For each ZIL file, find the range of lines spanned by each TELL call.
    # Then, for each annotation, if it is inside the range of a TELL call,
    # make sure it is at the first line. Keep track of violations.
    tell_annotations = []
    violations = []
    for path in zil_paths:
        print('Checking {}'.format(path['filename']))
        with open(path['full_path'], 'r') as f:
            zil_lines = f.readlines()

        # get span of each TELL call
        tell_calls = []
        start = -1
        for i, line in enumerate(zil_lines):
            if start != -1:
                if '>' in line:
                    tell_calls.append([start, i])
                    start = -1
            if '<TELL' in line:
                start = i
                if len(re.findall('<TELL.*?>', line)) > 0:  # starts and ends on same line
                    tell_calls.append([start, i])
                    start = -1

        # make sure each annotation of a TELL call is on the last line of the TELL
        for annotation in annotations:
            if annotation['filename'] != path['filename']:
                continue  # annotation is from a different file than the one we're focusing on

            line_number = re.sub('\([a-z]\)', '', annotation['line_number'])  # transform "1312(a)", "1312(b)", etc. into "1312"
            line_number = int(line_number) - 1  # convert to 0-indexing
            for call in tell_calls:
                if call[0] <= line_number <= call[1]:
                    tell_annotations.append([annotation['filename'], annotation['line_number']])
                    if line_number != call[1]:
                        violations.append([annotation, call[1] + 1])  # old annotation, and new line number


    print('\n\nFound {} TELL annotations:\n'.format(len(tell_annotations)))
    pp.pprint(tell_annotations)
    print('\n\n')

    if len(violations) == 0:
        print('Found no errors with TELL annotation placement!')
    else:
        print('\nFound {} errors with TELL annotation placement:\n'.format(len(violations)))
        pp.pprint(violations)

    return violations, tell_annotations


def check_jigs_up_annotations(args, game_name, csv_path):
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


    # For each ZIL file, find the range of lines spanned by each JIGS-UP call.
    # Then, for each annotation, if it is inside the range of a JIGS-UP call,
    # make sure it is at the first line. Keep track of violations.
    jigs_up_annotations = []
    violations = []
    for path in zil_paths:
        print('Checking {}'.format(path['filename']))
        with open(path['full_path'], 'r') as f:
            zil_lines = f.readlines()

        # get span of each JIGS-UP call
        jigs_up_calls = []
        start = -1
        for i, line in enumerate(zil_lines):
            if start != -1:
                if '>' in line:
                    jigs_up_calls.append([start, i])
                    start = -1
            if '<JIGS-UP' in line:
                start = i
                if len(re.findall('<JIGS-UP.*>', line)) > 0:  # starts and ends on same line
                    jigs_up_calls.append([start, i])
                    start = -1

        # make sure each annotation of a JIGS-UP call is on the first line of the JIGS-UP
        for annotation in annotations:
            if annotation['filename'] != path['filename']:
                continue  # annotation is from a different file than the one we're focusing on

            line_number = re.sub('\([a-z]\)', '', annotation['line_number'])  # transform "1312(a)", "1312(b)", etc. into "1312"
            line_number = int(line_number) - 1  # convert to 0-indexing
            for call in jigs_up_calls:
                if call[0] <= line_number <= call[1]:
                    jigs_up_annotations.append([annotation['filename'], annotation['line_number']])
                    if line_number != call[0]:
                        violations.append([annotation, call[0] + 1])  # old annotation, and new line number


    print('\n\nFound {} JIGS-UP annotations:\n'.format(len(jigs_up_annotations)))
    pp.pprint(jigs_up_annotations)
    print('\n\n')

    if len(violations) == 0:
        print('Found no errors with JIGS-UP annotation placement!')
    else:
        print('\nFound {} errors with JIGS-UP annotation placement:\n'.format(len(violations)))
        pp.pprint(violations)

    return violations, jigs_up_annotations


def check_elif_annotations(args, game_name, csv_path):
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


    # For each ZIL file, find the "elif" statements
    # Then, for each annotation, if it is on an "elif" statement,
    # move it to the "then" statement. Keep track of violations.
    elif_annotations = []
    violations = []
    for path in zil_paths:
        print('Checking {}'.format(path['filename']))
        with open(path['full_path'], 'r') as f:
            zil_lines = f.readlines()

        # get all "elif" statements
        elif_statements = []
        for i, line in enumerate(zil_lines):
            self_contained = re.findall('\(<.*?>\)\n', line)
            if ('(<' in line) and ('<COND (<' not in line) and (len(self_contained) == 0):
                elif_statements.append(i)

        # move annotations on "elif" statements to the following "then" statement
        for annotation in annotations:
            if annotation['filename'] != path['filename']:
                continue  # annotation is from a different file than the one we're focusing on

            line_number = re.sub('\([a-z]\)', '', annotation['line_number'])  # transform "1312(a)", "1312(b)", etc. into "1312"
            line_number = int(line_number) - 1  # convert to 0-indexing
            for statement_ln in elif_statements:
                if statement_ln == line_number:
                    elif_annotations.append([annotation['filename'], annotation['line_number']])
                    violations.append([annotation, statement_ln + 2])

    if len(violations) == 0:
        print('Found no elif annotations!')
    else:
        print('\nFound {} elif annotations:\n'.format(len(violations)))
        pp.pprint(violations)

    return violations, elif_annotations


def modify_csv(args, violations, checked_annotations, csv_path, mark_violations='[M]', mark_for_review='[X]'):
    assert os.path.exists(csv_path), 'Could not find {}'.format(csv_path)

    fixed_annotations = []
    with open(csv_path) as f:
        reader = csv.reader(f)
        for i, row in enumerate(reader):
            # discard the first row (header info) and rows between files (these typically have the second column empty)
            if (i > 0) and (row[1] != '') and (row[6] != 'N/A'):
                is_checked = False
                for checked_annotation in checked_annotations:
                    ln = re.sub('\([a-z]\)', '', str(row[1]))
                    if (checked_annotation[0] == row[0]) and (checked_annotation[1] == ln):
                        is_checked = True
                        break
                if is_checked is False:
                    row[4] = mark_for_review + row[4]
                
                count = 0
                for violation in violations:
                    # if annotation was a violation, then correct the line number
                    if violation[0]['index'] == i:
                        row[1] = violation[1]
                        row[4] = mark_violations + row[4]
                        count += 1
                assert count <= 1, 'Row {} has more than one associated violation.'.format(i)

            fixed_annotations.append(row)

    with open(csv_path, 'w') as f:
        writer = csv.writer(f)
        for annotation in fixed_annotations:
            writer.writerow(annotation)



def main(args):
    assert os.path.isdir(args.game_folder_path), 'Source path {} is not a directory'.format(args.game_folder_path)
    game_name = os.path.basename(args.game_folder_path)
    assert len(game_name) > 0, 'Improper game_folder_path (try removing / at the end)'
    csv_path = os.path.join(args.game_folder_path, game_name + '_annotations.csv')
    assert os.path.exists(csv_path), 'Could not find {}'.format(csv_path)

    print('\nFIXING ANNOTATION CSV')
    new_csv_path = os.path.join(args.game_folder_path, game_name + '_annotations_fixed.csv')
    if os.path.exists(new_csv_path):
        os.remove(new_csv_path)
    shutil.copyfile(csv_path, new_csv_path)
    
    jigs_up_violations, jigs_up_annotations = check_jigs_up_annotations(args, game_name, csv_path)
    tell_violations, tell_annotations = check_tell_annotations(args, game_name, csv_path)
    elif_violations, elif_annotations = check_elif_annotations(args, game_name, csv_path)

    violations = jigs_up_violations + tell_violations + elif_violations
    checked_annotations = jigs_up_annotations + tell_annotations + elif_annotations

    print('\n\nModifying CSV for all violations...')
    modify_csv(args, violations, checked_annotations, new_csv_path)
    print('Done.\n')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='See comments for description.')
    parser.add_argument('--game_folder_path', type=str,
                        help='path to directory of base game, with the unmodified annotation CSV in this directory,\
                              e.g. ./base_games/zork1  (NOTE: cannot have / at end)')
    args = parser.parse_args()
    main(args)
