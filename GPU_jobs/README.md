# Simple GPU Job

This sbatch script submits a fictitious python script called `trainLargeDNN.py` to a GPU node - you can imagine that this script contains a model written in Keras/Tensorflow that we want to train.

GPU nodes use CentOS8, so this job should be submitted from `login-icelake`. From a terminal, ssh into the login node:
`ssh <CRSid>@login-icelake.hpc.cam.ac.uk`

Description of sbatch directives:

- `#SBATCH -p pascal` indicates pascal partition - GPU node.
- `#SBATCH -A <PI_SURNAME>-SL3-GPU` indicates the account to be billed. This will be run at Service Level 3 (SL3) and will be billed out of the PI's GPU hours. `<PI_SURNAME>` should be replaced by the surname of your PI.
- `#SBATCH --gres=gpu:1` specifies the number of GPUs we want to use - one in this case.
- `#SBATCH --ntasks=1` and `SBATCH --nodes=1` specify the MPI ranks and number of nodes we want. We just want to run one script, one time, on one node, so these are both one.
- `#SBATCH --cpus-per-task=3` indicates the number of CPUs we want to use together with the GPU - three in this case.
- `#SBATCH --output` and `#SBATCH --error` redirect stderr and stdout to files, i.e., anything that would have been printed on the screen will be redirected to these files instead.
- `#SBATCH --time=4:00:00` specifies how long this script is allowed to run - four hours in this case.

We then use `module` to load the correct version of python, CUDA, and cuDNN for the network training we're going to do.

We then activate a virtual environment we made called `tensorflow-env` with the correct version of Tensorflow that we want.

Last line specifies what we want to run.
