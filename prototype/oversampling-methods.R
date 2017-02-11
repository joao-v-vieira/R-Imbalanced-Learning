random_oversampling <- function(input_matrix, num_samples){
  #consider that last variable is the variable to predict
                
  #detect minority class
  #if mean > 0.5, 0 is minority
  #if mean < 0.5, 1 is minority
  minority_class <- NULL
  
  if (mean(input_matrix [, ncol (input_matrix)]) < 0.5){
    minority_class <- 1
  } else if (mean(input_matrix [, ncol(input_matrix)]) > 0.5){
    minority_class <- 0
  } else {
    stop("Data set is perfectly balanced!")
  }
  
  #initiate output as NULL
  output_matrix <- NULL
  if (num_samples > 0){
    random_rows <- NULL
    #create num_samples rows with randomnly chosen rows which last variable has the minority class
    target_rows <- which(input_matrix [, ncol(input_matrix)] == minority_class, arr.ind = TRUE)
    random_rows <- sample(target_rows, num_samples, replace = TRUE)
    output_matrix <- input_matrix[random_rows, ]
  }
  
  rm(target_rows, random_rows)
  
  #return the randomly copied dataset rows
  return (output_matrix)
}