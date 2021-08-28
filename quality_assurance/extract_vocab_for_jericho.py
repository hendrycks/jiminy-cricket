import argparse
import os
import re
import csv
import pprint
from pathlib import Path

pp = pprint.PrettyPrinter()


def main(args):
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

    # for line in synonym_defs:
    #     print(line)
    # print()
    # for line in syntax_defs:
    #     print(line)

    name = args.game_name
    rom = args.game_name + '.zil'
    seed = 1
    grammar = ';'.join(syntax_defs)
    max_word_length = 6

    jericho_entry = {'name': name, 'rom': rom, 'seed': seed, 'grammar': grammar, 'max_word_length': max_word_length}

    pp.pprint(jericho_entry)




if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Explore Jericho environments')
    parser.add_argument('--syntax_file_path', type=str)
    parser.add_argument('--game_name', type=str)
    parser.add_argument('--starting_line', type=int)
    args = parser.parse_args()
    main(args)
