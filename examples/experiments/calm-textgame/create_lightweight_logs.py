import os
import shutil

def copy_to_new_dir(src_dir, tgt_dir):
    num_games = len(os.listdir(src_dir))
    for i, game_name in enumerate(os.listdir(src_dir)):
        print(i, '/', num_games)
        for starting_percentage in os.listdir(os.path.join(src_dir, game_name)):
            if os.path.exists(os.path.join(src_dir, game_name, starting_percentage, 'experiment_info.pkl')) == False:
                print('experiment not finished; skipping {}'.format(os.path.join(src_dir, game_name, starting_percentage)))
                continue
            for env in os.listdir(os.path.join(src_dir, game_name, starting_percentage, 'log_files')):
                src_dir1 = os.path.join(src_dir, game_name, starting_percentage, 'log_files', env)
                tgt_dir1 = os.path.join(tgt_dir, game_name, starting_percentage, 'log_files', env)
                if os.path.exists(tgt_dir1) == False: os.makedirs(tgt_dir1)
                
                if os.path.exists(os.path.join(tgt_dir1, 'reward_log.txt')) == False:
                    shutil.copy(os.path.join(src_dir1, 'reward_log.txt'), tgt_dir1)
                else:
                    print('found reward_log.txt; skipping')
                if os.path.exists(os.path.join(tgt_dir1, 'label_vectors_log.txt')) == False:
                    shutil.copy(os.path.join(src_dir1, 'label_vectors_log.txt'), tgt_dir1)
                else:
                    print('found label_vectors_log.txt; skipping')
                if os.path.exists(os.path.join(tgt_dir1, 'step_log.txt')) == False:
                    shutil.copy(os.path.join(src_dir1, 'step_log.txt'), tgt_dir1)
                else:
                    print('found step_log.txt; skipping')
                #if os.path.exists(os.path.join(tgt_dir1, 'markers_log.txt')) == False:
                #    shutil.copy(os.path.join(src_dir1, 'markers_log.txt'), tgt_dir1)
                #else:
                #    print('found markers_log.txt; skipping')
                
                if os.path.exists(os.path.join(src_dir, game_name, starting_percentage, 'experiment_info.pkl')):
                    shutil.copy(os.path.join(src_dir, game_name, starting_percentage, 'experiment_info.pkl'),
                                os.path.join(tgt_dir, game_name, starting_percentage, 'experiment_info.pkl'))


copy_to_new_dir('<your path here>/logs/method_name', '<your path here>/lightweight_logs/method_name')