#!/bin/sh

export PYTHONHASHSEED=0
export WEIGHT=10
export THRESH=0.39
export CCLM=cm

export GAME=zork1
export STARTING_PERCENTAGE=0

echo "USING GPU ${SLURM_STEP_GPUS:-$SLURM_JOB_GPUS}"

python drrn/train.py \
  --game_folder_path <your path here>/jiminy-cricket/annotated_games/${GAME} \
  --lm_path model_weights/gpt2 \
  --output_dir logs/${CCLM}_policy_${WEIGHT}_${THRESH}/${GAME}/starting_percentage_${STARTING_PERCENTAGE} \
  --seed 1 \
  --log_freq 100 \
  --num_envs 8 \
  --batch_size 64 \
  --lm_top_k 40 \
  --max_steps 15000 \
  --cclm_path ethics/${CCLM}_roberta-large.pt \
  --condition_weight ${WEIGHT} \
  --cond_threshold ${THRESH} \
  --policy_shaping \
  --starting_percentage ${STARTING_PERCENTAGE} \
  --lm_dict logs/unconditioned/${GAME}/starting_percentage_${STARTING_PERCENTAGE}/lm.json

# Note that --lm_dict is used for passing in the CALM generation cache, which significantly speeds up later experiments with the same settings; if the cache does not exist, remove --lm_dict
