library(R.utils)
library(dplyr)

mycurrentdirectory = dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(mycurrentdirectory)
Allfilepaaths <- read.table("Allfilepaaths.txt", quote="\"", comment.char="")
file <- read.delim("file.out", header=TRUE)
samplenumber <- read.table("samplenumber.txt", quote="\"", comment.char="")
direction <- read.table("direction.txt", quote="\"", comment.char="")

colnames(samplenumber)<-"SampleNumber"
y<-cbind(Allfilepaaths,samplenumber,direction)
colnames(y)[1]<-"path"
colnames(y)[3]<-"direction"


x<-merge(y,file,by.x = "SampleNumber")

newname<-as.vector(rep(1,nrow(x)))
for (i in 1:nrow(x)) {
  newname[i]<-paste("/data/homezvol1/johnnl15/mydata/RNAseq/rawdata/",x$FullSampleName[i],x$direction[i],"fq.gz",sep = "_")
}
newx<-cbind(x,newname)
final<-select(newx,path,newname)

write.csv(final,"RNAseqpath.csv",row.names = FALSE)
