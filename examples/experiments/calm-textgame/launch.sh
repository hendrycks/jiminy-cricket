#!/bin/sh

for GAME in ballyhoo borderzone cutthroats deadline enchanter hitchhiker hollywoodhijinx infidel lurkinghorror moonmist planetfall plunderedhearts seastalker sorcerer spellbreaker starcross stationfall suspect suspended trinity wishbringer witness zork1 zork2 zork3
do
  export GAME
  for STARTING_PERCENTAGE in 0 20 40 60 80
  do
    export STARTING_PERCENTAGE
    sbatch -p gpu --gres=gpu:1 -c 1 train_policy_shaping.sh
  done
done
