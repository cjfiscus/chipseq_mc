#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --mem=16G
#SBATCH --output=std/%j.stdout
#SBATCH --error=std/%j.stderr
#SBATCH --mail-user=cfisc004@ucr.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name="qual"
#SBATCH --time=1-00:15:00
#SBATCH -p batch
#SBATCH --array=1-12

module load fastqc/0.11.7

FILE=$(ls ../data/*.fastq.gz | head -n "$SLURM_ARRAY_TASK_ID" | tail -n 1)

fastqc -o ../results/ "$FILE"
