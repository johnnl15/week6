mycurrentdirectory = dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(mycurrentdirectory)

ATACnames <- read.table("~/Documents/ee283/ATACnames.txt", quote="\"", comment.char="")
ATACnames<-data.frame(ATACnames[3:nrow(ATACnames),])
colnames(ATACnames)<-"V1"

install.packages("splitstackshape")
library(splitstackshape)

Split<-cSplit(ATACnames,"V1","/")
Split2<-cSplit(Split,"V1_8","L1_")

newname<-as.vector(rep(1,nrow(Split2)))
for (i in 1:nrow(Split2)) {
  newname[i]<-paste("/data/homezvol1/johnnl15/mydata/ATACseq/rawdata/",x=Split2$V1_8_2[i],sep = "")
}

newx<-cbind(ATACnames,newname)

write.csv(newx,"ATACseqpath.csv",row.names = FALSE)

