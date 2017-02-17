random_oversampling <- function(input_matrix, num_samples = NULL, only_generated_data = TRUE) {

  
#is there is not value assigned to num_samples then the default value is one that perfectly balances the dataset
if(length(unique(input_matrix[,ncol(input_matrix)]))==2)   {
  if (is.null(num_samples)) {
 num_samples = length(which(input_matrix[ , ncol(input_matrix)] == 0)) - length(which(input_matrix[ , ncol(input_matrix)] == 1)) 
}  
  
  #consider that last variable is the variable to predict
  #detect minority class
  #if there are more 0 than 1s then 0 is minority
  #if there are more 1 than 0s then 1 is minoriry
  
if (length(which(input_matrix[ , ncol(input_matrix)] == 0)) - length(which(input_matrix[ , ncol(input_matrix)] == 1))){
  minority_class <- 1
} else if (length(which(input_matrix[ , ncol(input_matrix)] == 1)) - length(which(input_matrix[ , ncol(input_matrix)] == 0))){
  minority_class <- 0
} else {
  stop("Data set is perfectly balanced!")
}
  
if (num_samples > 0){
  #create num_samples rows with randomnly chosen rows which last variable has the minority class
  target_rows <- which(input_matrix [, ncol(input_matrix)] == minority_class, arr.ind = TRUE)
  random_rows <- sample(target_rows, num_samples, replace = TRUE)
  output_matrix <- input_matrix[random_rows, ]
}

#return only the generated data or the full dataset, depending on the value parsed    
if(only_generated_data){
  return (output_matrix)
} else {
  output_matrix <- rbind(input_matrix, output_matrix)
  return(output_matrix)
}
}else{
    
    message("Not a binary variable set as target")
  }
  
}
