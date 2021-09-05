import argparse
import os
import re
import csv


def main(args):
    # get list of annotations from CSV
    annotations_csv = []
    with open(args.csv_path) as f:
        reader = csv.reader(f)
        for i, row in enumerate(reader):
            # discard the first row (header info) and rows between files (these typically have the second column empty)
            if (i > 0) and (row[1] != '') and (row[6] != 'N/A'):
                annotations_csv.append('{}:{}'.format(row[0].split('.')[0], row[1]))

    zil_paths = []
    for root, dirs, files in os.walk(args.game_folder_path):
        for name in files:
            if name.split('.')[-1] == 'zil':
                zil_paths.append(os.path.join(root, name))

    # get list of annotations from the ZIL code
    annotations_zil = []
    for path in zil_paths:
        with open(path, 'r') as f:
            zil_lines = f.readlines()
            for line in zil_lines:
                annotations = re.findall('<PRINT-ID "(.*?)"', line)
                annotations2 = re.findall('\[ID: ([^"].*?)\]', line)
                assert (len(annotations) == 0) or (len(annotations2) == 0), 'Possible anomaly: {}\n{}\n{}'.format(line, annotations, annotations2)
                annotations_zil.extend(annotations + annotations2)


    errors = 0
    for annotation in annotations_csv:
        if annotation in annotations_zil:
            if annotations_zil.count(annotation) > 1:
                print('Annotation {} in ZIL code has duplicates'.format(annotation))
                errors += 1
        else:
            print('Annotation {} in CSV has no match in ZIL code'.format(annotation))
            errors += 1

    for annotation in annotations_zil:
        if annotation in annotations_csv:
            if annotations_csv.count(annotation) > 1:
                print('Annotation {} in CSV has duplicates'.format(annotation))
                errors += 1
        else:
            print('Annotation {} in ZIL code has no match in CSV'.format(annotation))
            errors += 1

    if errors == 0:
        print('Found no errors! Good job.')
    else:
        print('\nFound {} errors'.format(errors))



if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Checks if an annotation CSV aligns with the annotations in the code.')
    parser.add_argument('--game_folder_path', type=str, default='',
    					help='path to the game folder, e.g. ./zork1/')
    parser.add_argument('--csv_path', type=str, default='',
    					help='path to the annotation CSV, e.g. ./zork1/zork1_annotations.csv')
    args = parser.parse_args()
    main(args)
