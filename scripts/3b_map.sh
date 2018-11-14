#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --mem=16G
#SBATCH --output=std/%j.stdout
#SBATCH --error=std/%j.stderr
#SBATCH --mail-user=cfisc004@ucr.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name="map"
#SBATCH --time=1-00:15:00
#SBATCH -p batch
#SBATCH --array=1-12

module load bowtie2/2.3.4.1 samtools/1.8

FILE=$(ls ../results/*_trimmed.fq.gz | head -n "$SLURM_ARRAY_TASK_ID" | tail -n 1)
NAME=$(basename "$FILE" | cut -d_ -f1-4)

# map to reference
bowtie2 -x ../data/A_thaliana -U "$FILE" -S ../results/"$NAME".sam

# sam to sorted bam 
samtools view -bS ../results/"$NAME".sam | samtools sort - -o ../results/"$NAME".bam

# cleanup
rm ../results/"$NAME".sam
