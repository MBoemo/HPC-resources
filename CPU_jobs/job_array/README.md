# CPU Job Array

This sbatch script submits a python script called `simplePythonArray.py` (included) to a CPU node as a job array.

The Cascade Lake CPU nodes use CentOS7, so this job should be submitted from `login-cpu`. From a terminal, ssh into the login node:
`ssh <CRSid>@login-cpu.hpc.cam.ac.uk`

Description of sbatch directives:

- `#SBATCH -p cclake` indicates Cascade Lake partition - CPU node.
- `#SBATCH -A <PI_SURNAME>-SL3-CPU` indicates the account to be billed. This will be run at Service Level 3 (SL3) and will be billed out of the PI's CPU hours. `<PI_SURNAME>` should be replaced by the surname of your PI.
- `#SBATCH --ntasks=1` and `SBATCH --nodes=1` specify the MPI ranks and number of nodes we want. We just want to run one script, one time, on one node, so these are both one.
- `#SBATCH --cpus-per-task=1` indicates the number of CPUs we want to use - one in this case.
- `#SBATCH --output` and `#SBATCH --error` redirect stderr and stdout to files, i.e., anything that would have been printed on the screen will be redirected to these files instead. The `%a` gives us separate output and error files for each job in the array.
- `#SBATCH --time=0:01:00` specifies how long this script is allowed to run - one minute in this case.
- `#SBATCH --array=0-6` indicates that we're using a job array. We're going to run seven jobs: once when `SLURM_ARRAY_TASK_ID`=0, once when `SLURM_ARRAY_TASK_ID`=1, etc. up to 6.

We have a script that we want to run on each of the fictitious data folders called `input0`, `input1`, ..., `input6`. The job array allows us to pass the path of each of these folders to the same script, as seperate jobs, so they can all be processed in parallel.
