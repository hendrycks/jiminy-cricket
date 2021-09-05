import argparse
import os
import shutil
import re
import csv
import pprint

pp = pprint.PrettyPrinter()


# This script automatically adds annotations in the CSV to the code according
# to certain rules. We keep track of annotations that don't fit these rules
# and conditional annotations, which must be manually handled after a spot
# check of the automated annotations.



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
    for root, dirs, files in os.walk(args.source_game_dir):
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

    return violations


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
    for root, dirs, files in os.walk(args.source_game_dir):
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

    return violations


def modify_csv(args, violations, csv_path):
    assert os.path.exists(csv_path), 'Could not find {}'.format(csv_path)

    fixed_annotations = []
    with open(csv_path) as f:
        reader = csv.reader(f)
        for i, row in enumerate(reader):
            # discard the first row (header info) and rows between files (these typically have the second column empty)
            if (i > 0) and (row[1] != '') and (row[6] != 'N/A'):
                count = 0
                for violation in violations:
                    # if annotation was a violation, then correct the line number
                    if violation[0]['index'] == i:
                        row[1] = violation[1]
                        count += 1
                assert count <= 1, 'Row {} has more than one associated violation.'.format(i)
            fixed_annotations.append(row)

    with open(csv_path, 'w') as f:
        writer = csv.writer(f)
        for annotation in fixed_annotations:
            writer.writerow(annotation)


def insert_annotations(args, game_name, output_path):
    # get list of annotations from CSV
    csv_path = os.path.join(output_path, game_name + '_annotations.csv')

    annotations = []
    with open(csv_path) as f:
        reader = csv.reader(f)
        for i, row in enumerate(reader):
            # discard the first row (header info) and rows between files (these typically have the second column empty)
            if (i > 0) and (row[1] != '') and (row[6] != 'N/A'):
                annotations.append({'filename': row[0], 'line_number': row[1], 'conditioning': row[5], 'csv_row': row})

    print('Number of distinct annotations: ', len(annotations))


    # create annotation strings and handle overlapping annotations (multiple annotations on a single line, with format "1312(a)", "1312(b)", etc.)
    new_annotations = []
    for i, annotation in enumerate(annotations):
        line_number = re.sub('\([a-z]\)', '', annotation['line_number'])  # transform "1312(a)", "1312(b)", etc. into "1312"
        filename_no_zil = annotation['filename'].split('.')[0]
        pid_text = '<PRINT-ID "{}:{}">'.format(filename_no_zil, annotation['line_number'])
        pid2_text = '[ID: {}:{}]'.format(filename_no_zil, annotation['line_number'])

        found_overlapping = 0
        for tmp in new_annotations:
            if (tmp['line_number'] == line_number) and (tmp['filename'] == annotation['filename']):
                # overlapping annotation
                tmp['pid_text'] = tmp['pid_text'] + pid_text
                tmp['pid2_text'] = tmp['pid2_text'] + pid2_text
                tmp['original_indices'].append(i)
                found_overlapping = 1
                break

        if found_overlapping == 0:
            annotation['pid_text'] = pid_text
            annotation['pid2_text'] = pid2_text
            annotation['line_number'] = line_number
            annotation['original_indices'] = [i]
            new_annotations.append(annotation)
    original_annotations = annotations
    annotations = new_annotations

    print('Number of lines with annotations: ', len(annotations))
    print()

    # get list of paths to ZIL files for the indicated game
    zil_paths = []
    for root, dirs, files in os.walk(output_path):
        for name in files:
            if name.split('.')[-1] == 'zil':
                zil_paths.append({'filename': name, 'full_path': os.path.join(root, name)})


    missed_annotations = []
    conditional_annotations = []
    total_annotations_written = 0

    for path in zil_paths:
        print('Checking {}'.format(path['filename']))
        with open(path['full_path'], 'r') as f:
            zil_lines = f.readlines()
        

        # ========================== CREATE LISTS TO IMPLEMENT ANNOTATION RULES ========================== #

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

        # get span of each TELL call 
        tell_calls = []
        start = -1  # only used to track multi-line TELL calls
        for i, line in enumerate(zil_lines):
            if (start != -1) and ('>' in line):
                pos = -1
                for j, c in enumerate(line):
                    if c == '>':
                        pos = j
                        break
                tell_calls.append([start, i, pos])
                start = -1
            full_calls = re.findall('<TELL.*?>', line)
            first_halves = re.findall('<TELL[^>]*', re.sub('<TELL.*?>', '', line))  # delete full calls before looking for halves
            if len(full_calls) > 0:
                end_pos = len(line.split(full_calls[0])[0]) + len(full_calls[0]) - 1
                tell_calls.append([i, i, end_pos])
            if len(first_halves) == 1:
                start = i  # can only have 1 first half, in which case it spills over several lines until we see '>'

        # get lines with <COND
        cond_lines = []
        for i, line in enumerate(zil_lines):
            if '<COND' in line:
                cond_lines.append(i)

        # get lines with self-contained function calls (which don't call functions in their arguments)
        self_contained_calls = []
        for i, line in enumerate(zil_lines):
            calls = re.findall('<[^<>]*?>', line)
            if len(calls) > 0:
                self_contained_calls.append([i, calls[0]])

        # get lines inside ROOM or OBJECT definitions
        room_or_object_defs = []
        start = -1
        for i, line in enumerate(zil_lines):
            if start != -1:
                if '>' in line:
                    room_or_object_defs.append([start, i])
                    start = -1
            room_defs = re.findall('<ROOM', line)
            object_defs = re.findall('<OBJECT', line)
            if (len(room_defs) > 0) or (len(object_defs) > 0):
                start = i

        # get span of each string
        string_lines = []
        start_line = -1
        start_pos = -1
        for i, line in enumerate(zil_lines):
            for j, c in enumerate(line):
                if (start_line != -1) and (start_pos != -1) and (c == '"'):
                    string_lines.append([[start_line, i], [start_pos, j]])
                    start_line = -1
                    start_pos = -1
                    continue
                if c == '"':
                    start_line = i
                    start_pos = j

        # get span of each LTABLE entry that contains a string
        ltable_defs = []
        start = -1
        for i, line in enumerate(zil_lines):
            if (start != -1) and ('>' in line):
                ltable_defs.append([start, i])
                start = -1
            full_calls = re.findall('<LTABLE \(PURE\) ".*>', line)
            first_halves = re.findall('<LTABLE \(PURE\) "[^>]*', re.sub('<LTABLE \(PURE\) ".*>', '', line))
            if len(full_calls) > 0:
                ltable_defs.extend([[i,i] * len(full_calls)])
            if len(first_halves) == 1:
                start = i  # can only have 1 first half, in which case it spills over several lines until we see '>'


        # ========================== NOW START ADDING THE ANNOTATIONS ========================== #
        annotations_written = 0

        for annotation in annotations:
            if annotation['filename'] != path['filename']:
                continue  # annotation is from a different file than the one we're focusing on

            if annotation['conditioning'] != '':
                conditional_annotations.append(annotation)

            line_number = int(annotation['line_number']) - 1  # convert to 0-indexing

            # handle insertions before JIGS-UP
            inserted_before_jigs_up = False
            for call in jigs_up_calls:
                if call[0] <= line_number <= call[1]:
                    assert line_number == call[0], 'Somehow the JIGS-UP annotations were not fixed: {}'.format(annotation)
                    zil_lines[call[0]] = re.sub('<JIGS-UP', '{}<JIGS-UP'.format(annotation['pid_text']), zil_lines[call[0]])
                    inserted_before_jigs_up = True
                    break
            if inserted_before_jigs_up:
                annotations_written += 1
                continue

            # handle insertions before/after TELL calls
            inserted_around_tell = False
            for call in tell_calls:
                if call[0] <= line_number <= call[1]:
                    assert (line_number == call[0]) or (line_number == call[1]), 'Annotation in the middle of a tell call: {}'.format(annotation)
                    if line_number == call[1]:
                        # insert right after closing bracket of TELL call
                        zil_lines[call[1]] = zil_lines[call[1]][:call[2]+1] + annotation['pid_text'] + zil_lines[call[1]][call[2]+1:]
                        inserted_around_tell = True
                        break
                    elif line_number == call[0]:
                        zil_lines[call[0]] = re.sub('<TELL', '{}<TELL'.format(annotation['pid_text']), zil_lines[call[0]])
                        inserted_around_tell = True
                        break
            if inserted_around_tell:
                annotations_written += 1
                continue

            # handle insertion before <COND
            inserted_before_cond = False
            if line_number in cond_lines:
                zil_lines[line_number] = re.sub('<COND', '{}<COND'.format(annotation['pid_text']), zil_lines[line_number])
                inserted_before_cond = True
            if inserted_before_cond:
                annotations_written += 1
                continue

            # handle LTABLE entries with string
            inserted_in_ltable = False
            for call in ltable_defs:
                if inserted_in_ltable:
                    break
                if call[0] <= line_number <= call[1]:
                    # line is in an LTABLE
                    assert (line_number == call[0]) or (line_number == call[1]), 'Annotation in the middle of a multi-line LTABLE: {}'.format(annotation)
                    for string in string_lines:
                        if string[0][0] <= line_number <= string[0][1]:
                            # found string on same line
                            assert (line_number == string[0][0]) or (line_number == string[0][1]), 'Annotation in the middle of a multi-line string: {}'.format(annotation)
                            if line_number == string[0][1]:
                                # insert pid2 at end of string
                                zil_lines[line_number] = zil_lines[line_number][:string[1][1]] + annotation['pid2_text'] + zil_lines[line_number][string[1][1]:]
                                inserted_in_ltable = True
                                break
                            elif line_number == string[0][0]:
                                # insert pid2 at start of string
                                zil_lines[line_number] = zil_lines[line_number][:string[1][0]+1] + annotation['pid2_text'] + zil_lines[line_number][string[1][0]+1:]
                                inserted_in_ltable = True
                                break
            if inserted_in_ltable:
                annotations_written += 1
                continue

            # handle insertion before self-contained function calls
            inserted_before_function = False
            for call in self_contained_calls:
                if call[0] == line_number:
                    zil_lines[line_number] = zil_lines[line_number].replace(call[1], annotation['pid_text'] + call[1])
                    inserted_before_function = True
                    break
            if inserted_before_function:
                annotations_written += 1
                continue

            # handle things that didn't fit into the rules
            missed_annotations.append(annotation)

        print('Automatically inserted {} annotations'.format(annotations_written))
        total_annotations_written += annotations_written

        # ========================== REPLACE THE OLD FILE WITH THE NEW ONE ========================== #
        print('\nWRITING TO {}'.format(path['full_path']))
        # remove old file
        os.remove(path['full_path'])

        with open(path['full_path'], 'w') as f:
            for line in zil_lines:
                f.write(line)

    print('\nWriting missed_annotations.csv and conditional_annotations.csv')
    # write CSV for things that didn't fit
    with open(os.path.join(output_path, 'missed' + '_annotations.csv'), 'w') as f:
        writer = csv.writer(f)
        for annotation in missed_annotations:
            for i in annotation['original_indices']:
                writer.writerow(original_annotations[i]['csv_row'])
    with open(os.path.join(output_path, 'conditional' + '_annotations.csv'), 'w') as f:
        writer = csv.writer(f)
        for annotation in conditional_annotations:
            for i in annotation['original_indices']:
                writer.writerow(original_annotations[i]['csv_row'])
    print('Done.\n')

    print('Total annotations written:', total_annotations_written)







# TODO: for each game, get spans of JIGS-UP & TELL statements (can be multiple per line)
# get lines that start with <COND
# get lines with self-contained function calls
# get lines that are inside ROOM or OBJECT definitions and which have a string in them
# get lines that are part of an LTABLE
# (done; preserving for clarity)




def main(args):
    assert os.path.isdir(args.source_game_dir), 'Source path {} is not a directory'.format(args.source_game_dir)
    game_name = os.path.basename(args.source_game_dir)
    assert len(game_name) > 0, 'Improper source_game_dir (try removing / at the end)'
    csv_path = os.path.join(args.source_game_dir, game_name + '_annotations.csv')
    assert os.path.exists(csv_path), 'Could not find {}'.format(csv_path)

    output_path = os.path.join(args.output_dir, game_name)
    if os.path.exists(output_path):
        shutil.rmtree(output_path)
    shutil.copytree(args.source_game_dir, output_path)

    print('\nFIXING ANNOTATION CSV')
    new_csv_path = os.path.join(args.output_dir, game_name, game_name + '_annotations.csv')
    violations = check_jigs_up_annotations(args, game_name, csv_path)
    print('Modifying CSV for JIGS-UP...')
    modify_csv(args, violations, new_csv_path)
    print('Done.\n')
    violations = check_tell_annotations(args, game_name, csv_path)
    print('Modifying CSV for TELL...')
    modify_csv(args, violations, new_csv_path)
    print('Done.\n')

    print('\nINSERTING ANNOTATIONS')
    insert_annotations(args, game_name, output_path)



if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='See comments for description.')
    parser.add_argument('--source_game_dir', type=str,
                        help='path to directory of base game, with the unmodified annotation CSV in this directory,\
                              e.g. ./base_games/zork1  (NOTE: cannot have / at end)')
    parser.add_argument('--output_dir', type=str,
                        help='path to directory where you want the auto-annotated game, e.g. ./auto_annotations/')
    args = parser.parse_args()
    main(args)
