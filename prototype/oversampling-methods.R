random_oversampling <- function(input_matrix, num_samples = NULL, only_generated_data = TRUE) {
  
  if (length(unique(input_matrix[,ncol(input_matrix)]))==2) {
    
    # Create default value for num_samples
    if (is.null(num_samples)) {
      num_samples = length(which(input_matrix[ , ncol(input_matrix)] == 0)) - length(which(input_matrix[ , ncol(input_matrix)] == 1))
      }  
    
    # Check class distribution
    if (length(which(input_matrix[ , ncol(input_matrix)] == 0)) - length(which(input_matrix[ , ncol(input_matrix)] == 1))){
      minority_class <- 1
      } 
    else if (length(which(input_matrix[ , ncol(input_matrix)] == 1)) - length(which(input_matrix[ , ncol(input_matrix)] == 0))) {
      minority_class <- 0
      } 
    else {
      stop("Data set is perfectly balanced!")
    }
    
    # Generate data as exact copies of current minority class data
    if (num_samples > 0) {
      target_rows <- which(input_matrix [, ncol(input_matrix)] == minority_class, arr.ind = TRUE)
      random_rows <- sample(target_rows, num_samples, replace = TRUE)
      output_matrix <- input_matrix[random_rows, ]
      }
    
    # Return generated data or append them to current data
    if (only_generated_data) {
      return (output_matrix)
      } 
    else {
      output_matrix <- rbind(input_matrix, output_matrix)
      return(output_matrix)
      }
    }
  else {
    message("Not a binary variable set as target")
    }
  }