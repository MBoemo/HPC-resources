#!/bin/bash
#
#SBATCH -p icelake
#SBATCH -A <PI_SURNAME>-SL3-CPU
#SBATCH --job-name=simplePy
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --output="/home/<CRSid>/rds/hpc-work/2021_10_15_simplePython.stdout"
#SBATCH --error="/home/<CRSid>/rds/hpc-work/2021_10_15_simplePython.stderr"
#SBATCH --time=0:01:00

SCRIPT="/home/<CRSid>/rds/hpc-work/simplePython.py"

srun python $SCRIPT
