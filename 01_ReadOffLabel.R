# This Read Input Data
#setwd("C:/Data/work/project/Off-label_Drug");


readOffLabelData <- function (HIGHPRECISIONSUBSET=FALSE) {
  #File Name
  offlabFile <- "MEDI_01212013_0.csv"
  # Read data
  offLabel <- read.table(offlabFile,header=TRUE, sep=",",quote="\"",na.strings=c(""),
                         colClasses=c("integer","character","factor","character","factor","factor","factor"))
  # change type
#   offLabel$MENTIONEDBYRESOURCES <- as.factor(offLabel$MENTIONEDBYRESOURCES)
#   offLabel$HIGHPRECISIONSUBSET <- as.factor(offLabel$HIGHPRECISIONSUBSET)
#   offLabel$POSSIBLE_LABEL_USE <- as.factor(offLabel$POSSIBLE_LABEL_USE)

  if (HIGHPRECISIONSUBSET){
    offLabel <- subset(offLabel,HIGHPRECISIONSUBSET==1)
  }
  return (offLabel)
}