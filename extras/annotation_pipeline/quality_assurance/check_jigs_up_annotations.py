import argparse
import os
import re
import csv
import pprint

pp = pprint.PrettyPrinter()


# This script is for finding annotations of JIGS-UP functions where the line
# noted in the spreadsheet is not the line where the JIGS-UP function starts.
# We print out these instances and the line that they should be corrected to.


def main(args):
    # get list of annotations from CSV
    annotations = []
    with open(args.csv_path) as f:
        reader = csv.reader(f)
        for i, row in enumerate(reader):
            # discard the first row (header info) and rows between files (these typically have the second column empty)
            if (i > 0) and (row[1] != '') and (row[6] != 'N/A'):
                annotations.append({'filename': row[0], 'line_number': row[1]})

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
                if len(re.findall('<JIGS-UP .*>', line)) > 0:  # starts and ends on same line
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
                        violations.append([annotation['filename'], annotation['line_number'], 'should be {}'.format(call[0] + 1)])


    print('\n\nFound {} JIGS-UP annotations:\n'.format(len(jigs_up_annotations)))
    pp.pprint(jigs_up_annotations)
    print('\n\n')

    if len(violations) == 0:
        print('Found no errors! Good job.')
    else:
        print('\nFound {} errors:\n'.format(len(violations)))
        pp.pprint(violations)



if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='See comments for description.')
    parser.add_argument('--game_folder_path', type=str, default='',
    					help='path to the game folder, e.g. ./zork1/')
    parser.add_argument('--csv_path', type=str, default='',
    					help='path to the annotation CSV, e.g. ./zork1/zork1_annotations.csv')
    args = parser.parse_args()
    main(args)
