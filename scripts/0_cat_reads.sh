#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --mem=16G
#SBATCH --output=std/%j.stdout
#SBATCH --error=std/%j.stderr
#SBATCH --mail-user=cfisc004@ucr.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name="cat"
#SBATCH --time=1-00:15:00
#SBATCH -p batch 
#SBATCH --array=1-12

# get file to cat
FILELIST="../data/file_list.txt"
FILE=$(head -n $SLURM_ARRAY_TASK_ID $FILELIST | tail -n 1)

# name for outfile 
NAME=$(basename "$FILE" | cut -d_ -f1-4)

# cat file 
zcat $FILE | gzip > ../data/"$NAME".fastq.gz
