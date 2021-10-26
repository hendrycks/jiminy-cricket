import sys
import jericho
sys.path.insert(0,'../..')
from game_info import game_info
from annotated_env import AnnotatedEnv
from jericho import TemplateActionGenerator
import time
import pickle
import re
from anytree import Node, RenderTree
import os



class CustomTemplateActionGenerator(TemplateActionGenerator):
    def __init__(self, config, game_name):
        with open(config['syntax_defs'], 'rb') as f:
            self.syntax_defs = pickle.load(f)
        with open(config['synonym_defs'], 'rb') as f:
            self.synonym_defs = pickle.load(f)
        with open(config['object_dicts'], 'rb') as f:
            self.object_dicts = pickle.load(f)
        
        self.game_name = game_name
        self.tell_objects = game_info[self.game_name].get('tell_objects', [])
        
        # =================== GET TEMPLATES AND PRSAs =================== #
        templates = [syntax_def['template'] for syntax_def in self.syntax_defs]
        self.templates = templates
        prsa_list = [syntax_def['fn_name'][2:] for syntax_def in self.syntax_defs]
        self.prsa_list = prsa_list
    
    def generate_actions(self, objs, nodes):
        '''
        Generates a list of possible actions that can be taken given a list of objects to interact with
        and the current object tree.
        
        :param objs: Proper names of objects at current location
        :returns: List of (target, prsa, o1, o2) tuples paired with the templates they fit into
                  Target refers to the "OBJECT, <ACTION>" parser capability, where we direct <ACTION>
                  to a target object, e.g. when giving commands to robots or talking to people
                  When target is None, that is a standalone command (the most commonly used kind)
        '''
        current_tell_objects = [None] + list(set(self.tell_objects) & set(objs))
        
        actions = []
        for template, prsa in zip(self.templates, self.prsa_list):
            holes = template.count('OBJECT')
            if holes == 0:
                for target in current_tell_objects:
                    slots = (target, prsa, None, None)
                    actions.append([slots, template])
            elif holes == 1:
                for target in current_tell_objects:
                    for o1 in objs:
                        slots = (target, prsa, o1, None)
                        actions.append([slots, template])
            elif holes == 2:
                for target in current_tell_objects:
                    for o1 in objs:
                        for o2 in objs:
                            if o1 != o2:
                                slots = (target, prsa, o1, o2)
                                actions.append([slots, template])
        
        actions = self.actions_to_strings(actions, objs, nodes)
        
        return actions
    
    def choose_name_for_object(self, obj, action, interactive_first_names):
        """
        Given a list of candidate names for objects that can be interacted with and an object of interest,
        which has its first name in this list, disambiguate the object from others with the same first
        name (e.g. two different doors in the same room) by adding adjectives or using an alternative name.
        
        :param obj: proper name of object, i.e. its name in the source code
        :param action: input passed in for debugging
        :param interactive_first_names: candidate names for objects that can be interacted with
        :returns: disambiguated name for obj
        """
        obj_names = self.object_dicts[obj]['properties']['synonym']
        assert obj_names is not None, 'obj should always have names; {}'.format(action)
        obj_names = obj_names.split()
        if obj in obj_names:
            obj_name = obj
        else:
            obj_name = obj_names[0]
        if interactive_first_names.count(obj_name) > 1:
            obj_adjs = self.object_dicts[obj]['properties']['adjectives']
            if len(obj_adjs) > 0:  # first resort is adding an adjective
                obj_name = obj_adjs[0] + ' ' + obj_name
            elif len(obj_names) > 1:  # second resort is using a different synonym
                obj_name = obj_names[1]
        
        return obj_name
    
    def actions_to_strings(self, actions, interactive_objects, nodes):
        """
        Converts actions in their raw form to reasonable action strings.
        Actions in their raw form are [slots, template] lists returned by self.generate_actions.
        
        :param actions: list of [slots, template]
        :param interactive_objects: output of get_interactive_objects,
                                    for resolving name ambiguities w/ synonyms
        :returns: reasonable strings for the actions
        """
        action_strings = []
        
        # ==================== get names to call objects by ==================== #
        # get first names of objects
        interactive_first_names = []
        for obj in interactive_objects:
            obj_names = self.object_dicts[obj]['properties']['synonym']
            if obj_names is not None and nodes[obj]['parent'] != 'GLOBAL-OBJECTS':
                interactive_first_names.append(obj_names.split()[0])
        
        for action in actions:
            slots, template = action
            target, prsa, prso, prsi = slots
            
            # =================== disambiguate names for objects =================== #
            if target != None:
                target_name = self.choose_name_for_object(target, action, interactive_first_names)
            if prso != None:
                prso_name = self.choose_name_for_object(prso, action, interactive_first_names)
            if prsi != None:
                prsi_name = self.choose_name_for_object(prsi, action, interactive_first_names)
            
            # =================== apply special cases =================== #
            if prso == 'HANDS':
                prso_name = 'HANDS'
            if prsi == 'HANDS':
                prsi_name = 'HANDS'
            if prsa == 'MUNG' and template == 'DESTROY DOWN OBJECT WITH OBJECT':
                template = 'BREAK DOWN OBJECT WITH OBJECT'
            if prsa == 'OPEN' and template == 'DESTROY IN OBJECT':
                template = 'BREAK IN OBJECT'
            if prso == 'TEETH':
                prso_name = 'TEETH'
            if prsi == 'TEETH':
                prsi_name = 'TEETH'
            
            # =================== compose action string using object names =================== #
            holes = template.count('OBJECT')
            if holes == 2:
                action_str = template.replace('OBJECT', prso_name, 1).replace('OBJECT', prsi_name, 1)
            elif holes == 1:
                action_str = template.replace('OBJECT', prso_name, 1)
            elif holes == 0:
                action_str = template
            
            main_word = action_str.split()[0]
            synonyms = self.synonym_defs.get(main_word, [main_word])
            if target != None:
                prefix = 'TELL {}, '.format(target_name)
            else:
                prefix = ''
            action_set = [prefix + s + action_str[len(main_word):] for s in synonyms]
            
            action_strings.extend(action_set)
        
        return action_strings


class AnnotatedEnvWithObjectTree(AnnotatedEnv):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        action_gen_file_dir = f'{args[0]}/action_generator_files'  # args[0] is game_folder_path
        config = {'syntax_defs': os.path.join(action_gen_file_dir, 'syntax_defs.pkl'),
                  'synonym_defs': os.path.join(action_gen_file_dir, 'synonym_defs.pkl'),
                  'object_dicts': os.path.join(action_gen_file_dir, 'object_dicts.pkl'),
                  'room_dicts': os.path.join(action_gen_file_dir, 'room_dicts.pkl'),
                  'flags_that_change': os.path.join(action_gen_file_dir, 'flags_that_change.pkl'),
                  'global_vars_that_change': os.path.join(action_gen_file_dir, 'global_vars_that_change.pkl'),
                  'objects_and_rooms_in_text': os.path.join(action_gen_file_dir, 'objects_and_rooms_in_text.pkl')}
        with open(config['object_dicts'], 'rb') as f:
            self.object_dicts = pickle.load(f)
        with open(config['room_dicts'], 'rb') as f:
            self.room_dicts = pickle.load(f)
        with open(config['flags_that_change'], 'rb') as f:
            self.flags_that_change = pickle.load(f)
        with open(config['global_vars_that_change'], 'rb') as f:
            self.global_vars_that_change = pickle.load(f)
        with open(config['objects_and_rooms_in_text'], 'rb') as f:
            self.objects_and_rooms_in_text = pickle.load(f)
        
        # fixed flags at start of game (flags that change are updated with latest values in object tree)
        self.names_to_flags = {x['name']: x['properties']['flags'] for x in self.object_dicts.values()}
        
        self.player_object = game_info[self.game_name]['player_object']
        
        self.globals_to_exclude = game_info[self.game_name].get('globals_to_exclude', [])
        
        self.act_gen = CustomTemplateActionGenerator(config, self.game_name)
        
        # for handling a bug in Jericho's interface to Frotz where loading game state doesn't work
        self.in_code_loop = False
    
    def step(self, *args, **kwargs):
        """
        Same as super().step, but uses a heuristic to set self.in_code_loop to safely extract the object tree
        """
        out = super().step(*args, **kwargs)
        if '(YES or NO?)' in out[0][-20:]:
            self.in_code_loop = True
        else:
            self.in_code_loop = False
        return out
    
    def get_valid_actions(self, objtree, state_change_detection=False):
        nodes = objtree
        player_loc = nodes[self.player_object]['parent']
        if self.room_dicts.get(player_loc):
            directions = [x[0] for x in self.room_dicts[player_loc]['directions']]
        else:
            # player is inside an object / vehicle
            directions = ['OUT']
        
        interactive_objects = self.get_interactive_objects(nodes=nodes)
        actions = self.act_gen.generate_actions(interactive_objects, nodes)
        actions += directions + ['TAKE ALL']
        
        if state_change_detection:
            actions, equivalent_actions = self.filter_candidate_actions(nodes, actions)

        actions += ['WAIT']
        actions = sorted(list(set(actions)))
        
        actions = [x.lower() for x in actions]
        
        return actions
    
    def _remove_object_from_objtree(self, objtree, to_remove):
        # remove from parent object's list of children
        if objtree.get(objtree[to_remove]['parent']):
            objtree[objtree[to_remove]['parent']]['children'].remove(to_remove)
        # recursively remove children
        for child in objtree[to_remove]['children']:
            objtree = self._remove_object_from_objtree(objtree, child)
        # remove object
        del objtree[to_remove]
        
        return objtree
    
    def filter_candidate_actions(self, initial_objtree, actions):
        """
        :param initial_objtree: the initial object tree to compare to
        :param actions: list of action strings
        """
        # remove THIEF from dictionary, because of stochasticity
        if self.game_name == 'zork1':
            initial_objtree = self._remove_object_from_objtree(initial_objtree, 'THIEF')
        
        if 'TRANSBIT' in initial_objtree[self.player_object]['flags']:
            initial_objtree[self.player_object]['flags'].remove('TRANSBIT')
        
        outer_state = self.env.get_state()
        self.env.step('OFLG1')  # toggle printing object tree as part of the output
        state = self.env.get_state()
        filtered_actions = []
        for action in actions:
            obs = self.env.step(action)[0]

            objtree_text = obs.split('<start-otr>')[-1]
            if '<end-otr>' not in objtree_text:
                # printing was cut off; cannot safely parse object tree
                # as a heuristic, do not include these actions
                continue
            else:
                # now we have a valid object tree printout
                objtree_text = objtree_text.split('<end-otr>')[0]
            objtree = self.get_object_tree_nodes(objtree_text=objtree_text)

            if self.game_name == 'zork1':
                objtree = self._remove_object_from_objtree(objtree, 'THIEF')
            if 'TRANSBIT' in objtree[self.player_object]['flags']:
                objtree[self.player_object]['flags'].remove('TRANSBIT')
            
            if (objtree != initial_objtree):
                filtered_actions.append((action, hash(str(objtree))))
            self.env.set_state(state)
        
        self.env.set_state(outer_state)
        
        state_to_actions = {}
        for action, objtree_hash in filtered_actions:
            if state_to_actions.get(objtree_hash):
                state_to_actions[objtree_hash].append(action)
            else:
                state_to_actions[objtree_hash] = [action]
        
        final_actions = []
        for grouped_actions in state_to_actions.values():
            if ('TAKE ALL' in grouped_actions) and len(grouped_actions) > 1:
                grouped_actions.remove('TAKE ALL')  # use more specific term for object if possible
            average_length = sum([len(x) for x in grouped_actions]) / len(grouped_actions)
            final_actions.append(min(grouped_actions, key = lambda x: (len(x) - average_length) ** 2))  # prefer actions with average lengths
            
        equivalent_actions = {}
        for action, objtree_hash in zip(final_actions, state_to_actions.keys()):
            equivalent_actions[action] = {'actions': state_to_actions[objtree_hash], 'hash': objtree_hash}
        
        return final_actions, equivalent_actions
    
    def get_object_tree_nodes(self, objtree_text=None):
        """
        :param objtree_text: overrides object tree text
        :returns: individual objects and rooms with their parent object/room identified
        """
        if objtree_text is None:  # get objtree_parse if not provided
            state = self.get_state()  # not sure if we need this
            if self.in_code_loop:
                # if we are in a code loop, we don't want the "otr0" command to break the loop
                return None
            else:
                objtree_text = self.env.step('otr0')[0].split('<start-otr>')[-1]
            if '<end-otr>' not in objtree_text:
                # printing was cut off; cannot safely parse object tree
                return None
            else:
                # now we have a valid object tree printout
                objtree_text = objtree_text.split('<end-otr>')[0]
            self.set_state(state)
        
        objtree_text, globals_text = objtree_text.split('<gbl>')
        objtree_parse = re.findall('(-{0,1}[0-9]*?) / (.*?)\n', objtree_text)
        globals_parse = globals_text.lstrip('\n').rstrip('\n').split('\n')
        
        nodes = {}
        for i, obj in enumerate(objtree_parse):
            obj_name = self.objects_and_rooms_in_text[i]
#             print(obj_name, obj[0])
            if self.game_name == 'sorcerer' and obj_name == 'STAIRS':  # special case due to bug in game
                parent_name = 'unidentified parent'
            elif self.game_name == 'infidel' and obj_name == 'KEY':  # special case due to bug in game
                parent_name = 'unidentified parent'
            elif int(obj[0]) == -1:
                parent_name = 'unidentified parent'
            elif int(obj[0]) == -2:
                parent_name = 'object stored in ROOMS'
            else:
                parent_name = self.objects_and_rooms_in_text[int(obj[0])]
            flag_names = list(map(lambda x: self.flags_that_change[int(x)], obj[1].split()))
            obj_starter_flags = self.names_to_flags[obj_name]
            flag_names = list(set(obj_starter_flags) - set(self.flags_that_change)) + flag_names
            nodes[obj_name] = {'parent': parent_name, 'children': [],
                                  'flags': flag_names, 'room': False}
        
        for room in self.room_dicts:
            nodes[room] = {'parent': 'ROOMS', 'children': [],
                           'flags': [], 'room': True}
        
        for c in nodes:
            if nodes.get(nodes[c]['parent']):
                nodes[nodes[c]['parent']]['children'].append(c)
        
        # now add globals under a separate node
        nodes['GLOBAL_VARIABLES'] = {'parent': 'unidentified parent', 'children': [], 'room': False}  # make it blend in
        assert len(globals_parse) == len(self.global_vars_that_change), 'global var parse error\n{}\n{}'.format(globals_parse, self.global_vars_that_change)
        for i, gbl in enumerate(globals_parse):
            nodes['GLOBAL_VARIABLES'][self.global_vars_that_change[i]] = gbl
        
        if nodes['GLOBAL_VARIABLES']['HERE'] == '-1':
            nodes['GLOBAL_VARIABLES']['HERE'] = 'unidentified object'
        else:
            nodes['GLOBAL_VARIABLES']['HERE'] = self.objects_and_rooms_in_text[int(nodes['GLOBAL_VARIABLES']['HERE'])]
        
        return nodes
    
    def get_visible_objects(self, nodes, root):
        """
        Get visible objects starting from a root node (usually a room)
        """
        children = []
        
        if nodes[root].get('flags'):
            flags = nodes[root]['flags']
            if ('CONTBIT' in flags) and ('OPENBIT' not in flags):
                return [root]  # do not descend into closed containers
            if 'INVISIBLE' in flags and (root != self.player_object):
                # do not add invisible objects, but do add if the object is player_object, so we can
                # descent into the inventory
                return []
        
        for child in nodes[root]['children']:
            children.append(child)
        
        if len(children) == 0:
            return [root]
        else:
            return [root] + sum([self.get_visible_objects(nodes, root=child) for child in children], [])
    
    def get_interactive_objects(self, nodes=None):
        """
        Get objects that the player can interactive with
        """
        if nodes is None:
            nodes = self.get_object_tree_nodes()
        player_loc = nodes[self.player_object]['parent']
        
        # objects that can be interacted with that aren't in the current room
        global_objects = [obj for obj in nodes if (nodes[obj]['parent'] == 'GLOBAL-OBJECTS') and \
                          obj not in self.globals_to_exclude]
        
        if self.room_dicts.get(player_loc):
            local_globals = self.room_dicts[player_loc]['properties']['global'].split()
            if local_globals is None:
                local_globals = []
        else:
            # player is not in a room; as a heuristic, set local_globals to []
            local_globals = []
        #
        
        # objects in the current room that can be interacted with
        visible_objects = self.get_visible_objects(nodes, player_loc)
        if not (self.names_to_flags.get(player_loc) and 'VEHBIT' in self.names_to_flags[player_loc]):
            visible_objects.remove(player_loc)  # remove player loc if it isn't a vehicle
        if self.player_object in visible_objects:
            visible_objects.remove(self.player_object)
        #
        return list(set(global_objects + local_globals + visible_objects))
    
    def sort_node_names(self, nodes, root='ROOMS'):
        """
        For visualizing object tree with anytree
        """
        children = []
        
        for child in nodes[root]['children']:
            children.append(child)
        
        if len(children) == 0:
            return [root]
        else:
            return [root] + sum([self.sort_node_names(nodes, root=child) for child in children], [])
    
    def get_anytree(self):
        """
        For visualizing object tree with anytree
        """
        nodes = self.get_object_tree_nodes()
        sorted_names = self.sort_node_names(nodes)
        anytree_nodes = {'unidentified parent': None, 'object stored in ROOMS': None}
        for name in sorted_names:
            parent_node = anytree_nodes[nodes[name]['parent']]
            anytree_nodes[name] = Node(name, parent=parent_node)
        
        for pre, fill, node in RenderTree(anytree_nodes['ROOMS']):
            print("%s%s" % (pre, node.name))