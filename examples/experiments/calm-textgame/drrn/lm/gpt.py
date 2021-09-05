import sys
sys.path.insert(0, '../../../')

import torch
from custom_transformers import GPT2Tokenizer, GPT2LMHeadModel
from custom_transformers.modeling_utils import *
from jericho.util import clean
from jericho.defines import ILLEGAL_ACTIONS, NO_EFFECT_ACTIONS

MASK_OUT = ['license', 'terms', 'info', 'changes', 'actions', 'normal', 'win', 'menu', 'trace', 'about', 'places', 'objects', 'long', 'short', 'short', 'long', 'die', 'full', 'credit', 'help', 'super', 'save', 'again', 'version', 'script', 'quit', 'q', 'random', 'score', '.', ',', 'x', 'look', 'l', 'i', 'inventory', 'ex']

from .base_lm import BaseLM, device


class GPT2LM(BaseLM):
    def load_model(self, model_path, fp16, model_parallel=False):
        self.model = GPT2LMHeadModel.from_pretrained(model_path)
        self.generate_dict = {}
        self.model.eval()
        if model_parallel:
            print('Using model parallelism.')
            self.model.parallelize()
        else:
            self.model.to(device)

        if fp16:
            try:
                from apex import amp
            except ImportError:
                raise ImportError("Please install apex from https://www.github.com/nvidia/apex to use fp16 training.")

            #opt_level O3 gives fully half precision weights. Okay for GPT-2 as long as we don't need to finetune
            self.model = amp.initialize(self.model, opt_level='O1')
            torch.cuda.empty_cache()

    def load_tokenizer(self, model_path):
        self.tokenizer = GPT2Tokenizer.from_pretrained(model_path.split('/')[-1])
        self.tokenizer.add_special_tokens({'cls_token': '[CLS]', 'sep_token': '[SEP]'})
        self.tokenizer.padding_side = "left"
        self.tokenizer.pad_token = self.tokenizer.eos_token

    def act2ids(self, act):
        ret = self.tokenizer.encode(clean(act), add_prefix_space=True)
        if not ret: ret = [0]
        return ret

    def sent2ids(self, sent, maxlen=512):
        ret = self.tokenizer.encode(clean(sent))
        if len(ret) > maxlen:
            ret = ret[-maxlen:]
        if not ret: ret = [0]
        return ret

    def generate(self, input, k, mask_out=MASK_OUT, key=None):
        input_ids = self.sent2ids(input) if isinstance(input, str) else input
        if key is None:
            key = hash(tuple(input_ids))
        if key in self.generate_dict:
            return self.generate_dict[key]
        input_len = len(input_ids)
        input_ids = torch.tensor([input_ids]).to(device)
        mask_out = [self.tokenizer(w).input_ids for w in mask_out]
        
        outputs = self.model.generate(input_ids=input_ids, do_sample=False, num_beams=k,
                                num_return_sequences=k, max_length=input_len + 10, eos_token_id=50258,
                                pad_token_id=50258, bad_words_ids=mask_out)
        actions = [self.tokenizer.decode(output[input_len:]).split('[SEP]')[0].strip().lower() for output in outputs]
        actions = list(set(actions))
        self.generate_dict[key] = actions
        return actions
    
    def generate_with_valid(self, input, k, mask_out=MASK_OUT, key=None, allowed_actions=None):
        input_ids = self.sent2ids(input) if isinstance(input, str) else input
        if key is None:
            key = hash(tuple(input_ids))
        if key in self.generate_dict:
            return self.generate_dict[key]
        input_len = len(input_ids)
        input_ids = torch.tensor([input_ids]).to(device)
        mask_out = [self.tokenizer(w).input_ids for w in mask_out]
        
        outputs = self.model.generate(input_ids=input_ids, do_sample=False, num_beams=k,
                                num_return_sequences=k, max_length=input_len + 10, eos_token_id=50258,
                                pad_token_id=50258, bad_words_ids=mask_out, allowed_actions=allowed_actions)
        actions = [self.tokenizer.decode(output[input_len:]).split('[SEP]')[0].strip().lower() for output in outputs]
        actions = list(set(actions))
        self.generate_dict[key] = actions
        return actions
    
    def batched_generate(self, inputs, k, batch_size=None, mask_out=MASK_OUT, key=None):

        mask_out = [self.tokenizer(w).input_ids for w in mask_out]

        batched_actions = []
        new_inputs = []
        for i,sample in enumerate(inputs):
            key = hash(tuple(self.sent2ids(sample)))
            if key in self.generate_dict:
                batched_actions.append(self.generate_dict[key])
            else:
                batched_actions.append(key)
                new_inputs.append(clean(sample))

        num_seq = len(new_inputs)
        if not batch_size: batch_size = num_seq
        new_actions = []
        for i in range(0, num_seq, max(batch_size, 1)):
            batch = new_inputs[i:i+batch_size]
            bs = len(batch)
            batch = self.tokenizer(batch, return_tensors="pt", padding=True, truncation=False)
            ##### left truncation #####
            max_length = 512
            batch['input_ids'], batch['attention_mask'] = batch['input_ids'][:, -max_length:], batch['attention_mask'][:, -max_length:]
            ###########################
            input_len = len(batch['input_ids'][0])
            outputs = self.model.generate(input_ids=batch['input_ids'].to(device), attention_mask=batch['attention_mask'].to(device), 
                            max_length=input_len + 10, do_sample=False, num_beams=min(k * 2, 40), bad_words_ids=mask_out, 
                            pad_token_id=50258, eos_token_id=50258, num_return_sequences=k)
            outputs = outputs.reshape((bs, k, -1))
            actions = [list(set([self.tokenizer.decode(out[input_len:]).split('[SEP]')[0].split('[CLS]')[0].strip().lower() for out in output]))
                                            for output in outputs]
            new_actions += actions
        
        counter = 0
        for i,item in enumerate(batched_actions):
            if type(item) == int:
                key = item
                actions = new_actions[counter]
                self.generate_dict[key] = actions
                batched_actions[i] = actions
                counter += 1

        assert counter == len(new_actions), f"something wrong with self.generate_dict: {counter} new actions but got {len(new_actions)}"
        
        return batched_actions

    def score(self, input, acts):
        input_ids = self.sent2ids(input) if isinstance(input, str) else input
        input_len = len(input_ids)
        input_ids = torch.tensor([input_ids]).to(device)
        scores = []
        for act in acts.copy():
            if isinstance(act, str):
                act = self.act2ids(act) + [50258]
            act_tensor = torch.tensor([act]).to(device)
            example = torch.cat((input_ids, act_tensor), axis=1)
            with torch.no_grad():
                predictions = self.model(example)[0][0][input_len - 1:-1]
            log_p = torch.nn.functional.log_softmax(predictions, dim=-1)
            scores.append(log_p[range(len(act)), act].sum().item())
        return scores

