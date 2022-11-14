#!/bin/bash
#
#SBATCH -p cclake
#SBATCH -A <PI_SURNAME>-SL3-CPU
#SBATCH --job-name=simplePyArr
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --output="/home/<CRSid>/rds/hpc-work/2021_10_15_simplePythonArray.%a.stdout"
#SBATCH --error="/home/<CRSid>/rds/hpc-work/2021_10_15_simplePythonArray.%a.stderr"
#SBATCH --time=0:01:00
#SBATCH --array=0-6

SCRIPT="/home/<CRSid>/rds/hpc-work/HPC_demos/simplePythonArray.py"
INPUTDATA="/path/to/input${SLURM_ARRAY_TASK_ID}"

srun python $SCRIPT $INPUTDATA
