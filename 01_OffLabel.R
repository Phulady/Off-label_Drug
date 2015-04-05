setwd("/home/phulady/Applications/Off-label_Drugs");
offlabFile <- "MEDI_01212013_0.csv"
offLabel <- read.table(offlabFile,header=TRUE, sep=",",quote="\"",na.strings=c(""))
# change type
offLabel$MENTIONEDBYRESOURCES <- as.factor(offLabel$MENTIONEDBYRESOURCES)
offLabel$HIGHPRECISIONSUBSET <- as.factor(offLabel$HIGHPRECISIONSUBSET)
offLabel$POSSIBLE_LABEL_USE <- as.factor(offLabel$POSSIBLE_LABEL_USE)
