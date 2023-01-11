#!/bin/bash -l

#SBATCH -A snic2021-22-12
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 16:00:00
#SBATCH -J readstrimming
#SBATCH --mail-user xue.zhang@slu.se
#SBATCH --mail-type=ALL

cd  /crex/proj/snic2021-23-14/Xue/PRJDB10113/rawreads
mkdir /crex/proj/snic2021-23-14/Xue/PRJDB10113/clean
module load bioinfo-tools MultiQC/1.11 TrimGalore/0.6.1
for i in *.fastq.gz;
do
trim_galore -q 35 --phred33 --stringency 4 --illumina --gzip --fastqc $i -o ../clean

done 
