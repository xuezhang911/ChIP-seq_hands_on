#SBATCH -A snic2021-22-12
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 12:00:00
#SBATCH -J quantification
#SBATCH --mail-user xue.zhang@slu.se
#SBATCH --mail-type=ALL
index=/crex/proj/snic2021-23-14/Xue/ath_index
cd /crex/proj/snic2021-23-14/Xue/salmon1
for f in $(find /crex/proj/snic2021-23-14/Xue/raw/trimmomatic -name "*_trimmomatic_1.fq.gz");
 do
fnam=$(basename ${f/_1.fq.gz/})
 bowtie -m 1 --best --chunkmbs 200 /crex/proj/snic2021-23-14/Xue/BowtieIndex $f -S ${fnam}.sam
 samtools view -bS ${fnam}.sam  |samtools sort -o ${fnam}.bam 
 samtools index ${fnam}.bam
bedtools bamtobed -i ${fnam}.bam > ${fnam}.bed
bedtools slop -i ${fnam}.bed -g /crex/proj/snic2021-23-14/Xue/chromosomes_length -l 0 -r 150 -s > 
${fnam}_slop.bed
bedtools coverage -a ~/refs/TAIR10_all_33602_a.bed -b $a1"_slop.bed" > $a1"_coverage.bed"
~/IGVTools/igvtools count -e 150 $a1".bam" $a1".tdf" tair10

done
