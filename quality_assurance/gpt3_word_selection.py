import argparse
import os
import re
import csv
import pprint
from pathlib import Path

pp = pprint.PrettyPrinter()


def get_grammar(args):
    with open(args.syntax_file_path, 'r') as f:
        zil_lines = f.readlines()

    all_defs = []
    for i in range(len(zil_lines)):
        if i < args.starting_line:
            continue
        line = zil_lines[i].rstrip('\n').rstrip(' ')
        if line.startswith('<SYNTAX'):  # ingores syntax that was commented out
            if line.endswith('>'):
                all_defs.append(line)
            else:
                next_line = zil_lines[i+1].rstrip('\n')
                if next_line.endswith('>'):
                    all_defs.append(line + next_line)
                else:
                    next_next_line = zil_lines[i+2].rstrip('\n')
                    all_defs.append(line + next_line + next_next_line)
        if line.startswith('<VERB-SYNONYM'):
            all_defs.append(line)

    synonym_defs = []
    syntax_defs = []

    # strip outer stuff in definitions and separate into syntax and synonyms
    for line in all_defs:
        syntax = re.findall('<SYNTAX (.+?)\s=', line)
        synonym = re.findall('<VERB-SYNONYM (.+?)>', line)
        assert (len(syntax) + len(synonym)) == 1, line
        syntax_defs.extend(syntax)
        synonym_defs.extend(synonym)

    # remove FIND syntax to bring closer to Jericho--plus, we don't really need it for fuzzing
    for i in range(len(syntax_defs)):
        syntax_defs[i] = re.sub('\s(\(.+?\))', '', syntax_defs[i])
        syntax_defs[i] = re.sub('\s+', ' ', syntax_defs[i])

    # remove commented out synonyms
    for i in range(len(synonym_defs)):
        synonym_defs[i] = re.sub('\s+', ' ', synonym_defs[i])
        synonym_defs[i] = re.sub('( ;.+)', '', synonym_defs[i])

    # for line in synonym_defs:
    #     print(line)
    # print()
    # for line in syntax_defs:
    #     print(line)

    # convert to format for Jericho fuzzing (for now, don't incorporate synonyms)
    for i in range(len(syntax_defs)):
        syntax_defs[i] = syntax_defs[i].lower()
        syntax_defs[i] = re.sub('object', 'OBJ', syntax_defs[i])
        syntax_defs[i] = syntax_defs[i].split(' ')

    return syntax_defs


def get_object_names(args):
    zil_paths = []
    for root, dirs, files in os.walk(args.game_folder_path):
        for name in files:
            if name.split('.')[-1] == 'zil':
                zil_paths.append(os.path.join(root, name))

    # get list of objects along with their synonyms and descriptions
    object_list = []
    for path in zil_paths:
        with open(path, 'r') as f:
            all_zil_lines = f.read()
            objects_in_file = re.findall('(?<!;)<OBJECT (.*?)\s[\s\S]*?\(SYNONYM (.*?)\)\s[\s\S]*?\(DESC "(.*?)"\)',
                all_zil_lines)
            object_list.extend(objects_in_file)

    for i in range(len(object_list)):
        object_list[i] = list(object_list[i])
        name_synonyms = object_list[i][1].lower().split(' ')
        desc = object_list[i][2]
        object_name = object_list[i][0].lower()

        # select the synonym to use as the object's name
        # first priority: if synonym equals object_name, use that
        # second priority: if synonym is in desc, use that
        # fallback: use first synonym
        name_to_use = name_synonyms[0]
        for synonym in name_synonyms:
            if synonym in desc:
                name_to_use = synonym
                break
        for synonym in name_synonyms:
            if synonym == object_name:
                name_to_use = synonym
                break

        object_list[i].append(name_to_use)

    return object_list


def main(args):
    syntax_defs = get_grammar(args)
    object_list = get_object_names(args)
    
    # now construct the tree of possibilities (to handle overlapping templates)
    template_tree = {}
    for syntax_def in syntax_defs:
        if len(syntax_def) == 1:
        template_tree[syntax_def[0]]




if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Explore Jericho environments')
    parser.add_argument('--syntax_file_path', type=str,
                        help='path to syntax.zil, e.g. ./annotated_games/zork-substrate/syntax.zil')
    parser.add_argument('--starting_line', type=int,
                        help='line in the syntax file from which to start parsing')
    parser.add_argument('--game_folder_path', type=str,
                        help='path to game folder, e.g. ./annotated_games/zork1/')
    args = parser.parse_args()
    main(args)
