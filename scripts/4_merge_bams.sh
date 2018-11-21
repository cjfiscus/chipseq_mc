#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --mem=32G
#SBATCH --output=std/%j.stdout
#SBATCH --error=std/%j.stderr
#SBATCH --mail-user=cfisc004@ucr.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name="merge"
#SBATCH --time=1-00:15:00
#SBATCH -p batch

module load samtools/1.8

# merge bams
samtools merge --threads 4 ../results/merged_bams/YQ1L1_merged.bam ../results/unmerged_bams/YQ1L1*
samtools merge --threads 4 ../results/merged_bams/YQ1L2_merged.bam ../results/unmerged_bams/YQ1L2*
samtools merge --threads 4 ../results/merged_bams/YQ1L3_merged.bam ../results/unmerged_bams/YQ1L3*
samtools merge --threads 4 ../results/merged_bams/YQ1L4_merged.bam ../results/unmerged_bams/YQ1L4*
samtools merge --threads 4 ../results/merged_bams/YQ1L5_merged.bam ../results/unmerged_bams/YQ1L5*
samtools merge --threads 4 ../results/merged_bams/YQ1L6_merged.bam ../results/unmerged_bams/YQ1L6*
