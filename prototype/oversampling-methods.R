random_oversampling <- function(numSamples, sd){
  #consider that last variable is the variable to predict
                
  #detect minority class
  #if mean > 0.5, 0 is minority
  #if mean < 0.5, 1 is minority
  minority_class <- NULL
  
  if (mean(ds[,ncol(ds)] < 0.5)){
    minority_class <- 1
  } else if (mean(ds[,ncol(ds)]) > 0.5){
  minority_class <- 0
  } else {
    stop("Data set is perfectly balanced!")
  }
  #initiate output as NULL
  ds_oversampled <- NULL
  if (numSamples > 0){
    overInd <- NULL
    #create numSamples rows with randomnly chosen rows which last variable has the minority class
    overInd <- as.integer(sample(row.names(subset(ds, ds[, ncol(ds)] == minority_class)), numSamples, replace = TRUE))
    ds_oversampled <- ds[overInd,]
    #fix the number of rows index
    row.names(ds_oversampled) <- 1:nrow(ds_oversampled)
  }
  rm(overInd)
  
  #return the randomly copied dataset rows
  return (ds_oversampled)
}