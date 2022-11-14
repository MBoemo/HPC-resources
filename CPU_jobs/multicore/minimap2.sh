#!/bin/bash
#
#SBATCH -p icelake
#SBATCH -A <PI_SURNAME>-SL3-CPU
#SBATCH --job-name=align
#SBATCH --nodes=1 
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=76
#SBATCH --output="/home/<CRSid>/rds/hpc-work/alignment.stdout"
#SBATCH --error="/home/<CRSid>/rds/hpc-work/alignment.stderr"
#SBATCH --time=6:00:00

MINIMAP2="/home/<CRSid>/rds/hpc-work/minimap2-2.17_x64-linux/minimap2"
OUTSAM="/home/<CRSid>/rds/hpc-work/alignments.sam"
GENOME="/home/<CRSid>/rds/hpc-work/reference.fasta"
QUERY="/home/<CRSid>/rds/hpc-work/reads.fastq"

srun $MINIMAP2 -ax map-ont -t 76 -a -o $OUTSAM $GENOME $QUERY
