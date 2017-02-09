#clear vars and console
rm(list=ls())
cat("\014")
#import libraries
library(tcltk)

#select input file .csv and get working directory
cat(sprintf("Please select the data set (.csv file)..."))
ds_address <- tk_choose.files(caption = "Choose dataset in .csv format", multi = FALSE)
ds <- read.csv(ds_address)
name <- basename(ds_address)
mainDir <- dirname(ds_address)
cat(sprintf("%s was loaded!", name))

#create output folder on working directory
outputDir <- "Output"
setwd(file.path(mainDir))
if (file.exists(outputDir)){
  #setwd(file.path(mainDir))
} else {
  dir.create(file.path(mainDir, outputDir))
  #setwd(file.path(mainDir))
}

#generate random number from 1 to the double of the size of the dataset
numSamples = as.integer(sample(1:dim(ds)[1]*2,1))

source('RandomOversampling.R')
ds_oversampled <- RandomOversampling(numSamples, ds)

#write output as .csv
setwd(file.path(mainDir,outputDir))
write.table(ds_oversampled, file = "irisOversampled.csv", sep = ",", row.names = FALSE)
cat(sprintf("\nirisOversampled.csv was created! Check %s", file.path(mainDir, outputDir)))