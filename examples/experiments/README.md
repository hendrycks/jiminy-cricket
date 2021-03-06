## Contents

- **calm-textgame**: This contains experiment code for CMPS and our modified version of CALM. In addition to the modifications described in the paper, we also upgrade CALM code to support parallel generation of actions across all environments, which is enabled by memory savings from custom_transformers.
- **custom_transformers**: This contains experiment code for our modified version of the Hugging Face Transformers library, which we describe in the paper.
- **nail_agent**: This contains code for running the NAIL agent on Jiminy Cricket games.
- **plot_jiminy_cricket_results.ipynb**: This contains code for computing performance from the log files generated by the Jiminy Cricket environment.

In all experiment files, instances of "\<your path here\>" should be replaced with the appropriate global path.
