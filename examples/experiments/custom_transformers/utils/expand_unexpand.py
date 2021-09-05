import torch

def generic_expand(inp, expand_size):
    """
    added for custom_transformers

    basically does what _expand_inputs_for_generation does, but to a single input tensor
    """
    selection_idx = (
        torch.arange(inp.shape[0]).view(-1, 1).repeat(1, expand_size).view(-1).to(inp.device)
    )
    inp = inp.index_select(0, selection_idx)
    return inp

def generic_unexpand(inp, expand_size):
    """
    added for custom_transformers

    reverses _generic_expand
    """
    assert inp.shape[0] % expand_size == 0, 'input to _generic_unexpand must be expanded'
    batch_size = inp.shape[0] // expand_size
    selection_idx = torch.arange(batch_size).to(inp.device) * expand_size
    inp = inp.index_select(0, selection_idx)
    return inp