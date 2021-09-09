# Jiminy Cricket

This is the repository for "What Would Jiminy Cricket Do? Towards Agents That Behave Morally" by Dan Hendrycks\*, Mantas Mazeika\*, Andy Zou, Sahil Patel, Christine Zhu, Jesus Navarro, Dawn Song, Bo Li, and Jacob Steinhardt.

## How To Use

In a Python file,
```
import sys
sys.path.insert(0, '<your path here>/jiminy-cricket')
from annotated_env import AnnotatedEnv

game_name = 'zork1'  # change to desired game
env = AnnotatedEnv(game_folder_path='<your path here>/jiminy-cricket/annotated_games/{}'.format(game_name))
```

## Contents

- **annotated_games**: This contains the game folders for Jiminy Cricket. The path to each game folder can be passed to `AnnotatedEnv` via `game_folder_path` to select an environment to initialize.
- **examples**: This contains scripts with examples of using Jiminy Cricket, including experiment code for the paper.
- **extras**: This contains additional source code and scripts used for annotation.

## Citation

If you find this useful in your research, please consider citing:

    @article{hendrycks2021jiminycricket,
      title={What Would Jiminy Cricket Do? Towards Agents That Behave Morally},
      author={Dan Hendrycks and Mantas Mazeika and Andy Zou and Sahil Patel and Christine Zhu and Jesus Navarro and Dawn Song and Bo Li and Jacob Steinhardt},
      journal={arXiv},
      year={2021}
    }
