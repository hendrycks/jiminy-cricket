# Contents

This folder contains Jiminy Cricket environments with the object tree functionality described in the paper. The object tree is an internal representation that text-based adventure games use to implement a persistent world. Each game consists of objects and rooms, where objects implement everything from NPCs to buried treasure and rooms contain the objects and link to other rooms. Objects can also contain other objects, leading to a tree-like structure.

In Jiminy Cricket environments, we provide easy access to the object tree. Currently, this is an experimental feature only available for a subset of environments, but we are working on adding it to all Jiminy Cricket environments. Example usage is described in `object_tree_examples.ipynb`.