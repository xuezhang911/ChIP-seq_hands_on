#!/bin/bash -l

#SBATCH -A snic2021-22-12
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 16:00:00
#SBATCH -J ChIPpeakcalling
#SBATCH --mail-user xue.zhang@slu.se
#SBATCH --mail-type=ALL
cd /crex/proj/snic2021-23-14/Xue/PRJDB10113/mapping/normdup
module load bioinfo-tools MACS/3.0.0a6
macs3 callpeak -t DRR235311.bam  -c DRR235310.bam -n WT_H3K4me1_2 -f BAM -g 1.3e+8  --outdir 
../../peakcalling/normdup --bdg -q 0.01

