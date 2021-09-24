#!/bin/sh

export PYTHONHASHSEED=0

python drrn/train.py \
  --game_folder_path <your path here>/jiminy-cricket/annotated_games/${GAME} \
  --lm_path model_weights/gpt2 \
  --output_dir ./logs/unconditioned/${GAME}/starting_percentage_${STARTING_PERCENTAGE} \
  --seed 1 \
  --log_freq 100 \
  --num_envs 8 \
  --batch_size 64 \
  --lm_top_k 40 \
  --max_steps 15000 \
  --starting_percentage ${STARTING_PERCENTAGE} \
