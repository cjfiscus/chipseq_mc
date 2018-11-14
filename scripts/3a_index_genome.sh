#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --mem=16G
#SBATCH --output=std/%j.stdout
#SBATCH --error=std/%j.stderr
#SBATCH --mail-user=cfisc004@ucr.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name="ind"
#SBATCH --time=1-00:15:00
#SBATCH -p batch

module load bowtie2/2.3.4.1
bowtie2-build ../data/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa ../data/A_thaliana 
