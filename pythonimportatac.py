import os
import pandas as pd

df = pd.read_csv("/data/homezvol1/johnnl15/ATACseqpath.csv")
for x in range(0,len(df)):
	os.symlink(df.V1[x],df.newname[x])

#os.symlink("/data/class/ecoevo283/public/RAWDATA/RNAseq/RNAseq384plex_flowcell01/Project_plex1/Sample_1/1_CACTTGA_L001_R1_001.fastq.gz","/data/homezvol1/johnnl15/mydata/RNAseq/rawdata/hellogovernor.fastq.gz")
