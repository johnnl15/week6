## Assignment 5

Import DNA running this code: 

```

ln -s /data/class/ecoevo283/public/RAWDATA/DNAseq/*fq.gz /data/homezvol1/johnnl15/mydata/DNAseq/rawdata

```

For RNAseq, I had to print out a couple of helper txt files. 

```

cat /data/class/ecoevo283/public/RAWDATA/RNAseq/RNAseq384_SampleCoding.txt | awk ‘{print $1}’ > file.out
find /data/class/ecoevo283/public/RAWDATA/RNAseq/RNAseq384plex_flowcell01/ -name "*.fastq.gz" > allfilepaaths.txt
find /data/class/ecoevo283/public/RAWDATA/RNAseq/RNAseq384plex_flowcell01/ -name "*.fastq.gz" 
	| cut -d "/" -f 11 | cut -d "_" -f 1 > samplenumber.txt
find /data/class/ecoevo283/public/RAWDATA/RNAseq/RNAseq384plex_flowcell01/ -name "*.fastq.gz" | cut -d "/" -f 11 
	| cut -d "_" -f 4 > direction.txt

```

Then I imported those above files into R and created a two column text file utilizing [R code](RNAseqImport.R)
The output is [RNAseqpath.csv](RNAseqpath.csv) which serves as my input file in [python RNA import](pythonimport.py). 
For ATACseq, I use a similar protocol as above: 

```

find /data/class/ecoevo283/public/RAWDATA/ATACseq/ > ATACnames.txt

```

I import this file into R and run [ATAC R code](ATACseqimport.R). Which produces the file [ATAC path](ATACseqpath.csv) that
I used as input file for my [ATAC python import](pythonimportatac.py). The example file of my tree is the following, [tree](Tree.txt).
I ran fastq on P004_R1.fq.gz and here is the [base quality](per_base_quality.png).  
