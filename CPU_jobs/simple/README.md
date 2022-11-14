# Simple CPU Job

This sbatch script submits a python script called `simplePython.py` (included) to a CPU node.

The Ice Lake CPU nodes use CentOS8, so this job should be submitted from `login-icelake`. From a terminal, ssh into the login node:
`ssh <CRSid>@login-icelake.hpc.cam.ac.uk`

Description of sbatch directives:

- `#SBATCH -p icelake` indicates Ice Lake partition - CPU node.
- `#SBATCH -A <PI_SURNAME>-SL3-CPU` indicates the account to be billed. This will be run at Service Level 3 (SL3) and will be billed out of the PI's CPU hours. `<PI_SURNAME>` should be replaced by the surname of your PI.
- `#SBATCH --ntasks=1` and `SBATCH --nodes=1` specify the MPI ranks and number of nodes we want. We just want to run one script, one time, on one node, so these are both one.
- `#SBATCH --cpus-per-task=1` indicates the number of CPUs we want to use - one in this case.
- `#SBATCH --output` and `#SBATCH --error` redirect stderr and stdout to files, i.e., anything that would have been printed on the screen will be redirected to these files instead.
- `#SBATCH --time=0:01:00` specifies how long this script is allowed to run - one minute in this case.

We then specify the path to our script and run it.
