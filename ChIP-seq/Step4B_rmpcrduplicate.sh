#!/bin/bash -l

#SBATCH -A snic2021-22-12
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 16:00:00
#SBATCH -J rmPCRduplicate
#SBATCH --mail-user xue.zhang@slu.se
#SBATCH --mail-type=ALL
cd /crex/proj/snic2021-23-14/Xue/PRJDB10113/mapping
module load bioinfo-tools samtools/1.10
for i in /crex/proj/snic2021-23-14/Xue/PRJDB10113/mapping/DRR*.bam;
do

a1=$(echo $i | sed -e 's/.bam//')
printf "this_is\t$a1\n"
 samtools markdup -r $i $a1".rmdup.bam"
#index bam file
samtools index $a1".rmdup.bam"
#qc control
samtools flagstat $a1".rmdup.bam"> $a1".rmdup.stat"

mv $a1".rmdup.stat" ../quanlitycontrols
done
