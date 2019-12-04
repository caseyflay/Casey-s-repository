https://github.com/PlantandFoodResearch/bioinf_GBS_Actinidia/blame/cb2dc6a1346a1138e09a5ea5f5c75b1b270269f4/2016_Jibran_GBS/06_demultiplex_P1L5.sh
baseInputDir=/input/genomic/plant/Actinidia/chinensis/GBS/2016_CAGRF12857
baseDir=/workspace/hrtcdf/GBSremap
#P1, L5
prefix=P1L5
fastQ=$baseInputDir/AGRF_CAGRF12857_C9NREANXX/P1_HR_C9NREANXX_NoIndex_L005_R1.fastq.gz
workDir=$baseDir/$prefix
export workDir=/workspace/hrtcdf/GBSremap
echo $workDir
mkdir –p $workDir
newBarcode=$/workspace/hrtcdf/GBSremap/KeaBarP1.txt
module load ea-utils/1.1.2-806
#for Q in 0 10 20 30 do
subDir='Q'$Q
logDir=$workDir/$subDir/.log
mkdir -p $logDir
cd $workDir/$subDir
bsub -o $logDir/01.dex.log -e $logDir/01.dex.err -J $prefix$subDir -m wkoppb31 /software/bioinformatics/ea-utils.1.1.2-806/bin/fastq-multx -b -m 0 -q $Q -d 1 -B $newBarcode $fastQ -o R1.%.fq
done

#P1,L6
prefix=P1L6
fastQ=$baseInputDir/AGRF_CAGRF12857_C9NREANXX/P1_HR_C9NREANXX_NoIndex_L006_R1.fastq.gz
workDir=$baseDir/$prefix
newBarcode=$baseDir/KeaBarP1.txt
module load ea-utils/1.1.2-806

subDir='Q'$Q
logDir=$workDir/$subDir/.log
cd $workDir/$subDir
bsub -o $logDir/01.dex.log -e $logDir/01.dex.err -J $prefix$subDir -m wkoppb31 /software/bioinformatics/ea-utils.1.1.2-806/bin/fastq-multx -b -m 0 -q $Q -d 1 -B $newBarcode $fastQ -o R1.%.fq


