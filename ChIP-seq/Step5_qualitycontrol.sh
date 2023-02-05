#!/bin/bash -l
#SBATCH -A snic2021-22-12
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 16:00:00
#SBATCH -J qualitycontrol
#SBATCH --mail-user xue.zhang@slu.se
#SBATCH --mail-type=ALL
cd /crex/proj/snic2021-23-14/Xue/PRJDB10113/quanlitycontrols
module load bioinfo-tools samtools/1.10
for i in /crex/proj/snic2021-23-14/Xue/PRJDB10113/mapping/DRR*.bam;
do
a1=$(echo $i | sed -e 's/.bam//')
printf "this_is\t$a1\n"
 samtools flagstat $i> $a1".stat";
Done

