These are instructions for creating gametext.txt, which is used in create_compressed_game.py

Run in game folder after creating zap files:
cat ./*.zap | grep '"' > gametext.txt

Then run clean_gametext.py


This is deprecated. Just run create_compressed_game.py. No need for gametext.txt anymore.
