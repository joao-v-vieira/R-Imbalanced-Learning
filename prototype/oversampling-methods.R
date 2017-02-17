random_oversampling <- function(input_matrix, num_samples = NULL, only_generated_data = TRUE) {
  
  # Checks
  target_column <- input_matrix[, ncol(input_matrix)]
  target_column <- check_binary_target(target_column)
  
  # Dataset parameters
  minority_class_indices <- which(target_column == 1)
  majority_class_indices <- which(target_column == 0)
    
  # Create default value for num_samples
  if (is.null(num_samples)) {
    num_samples <- length(majority_class_indices) - length(minority_class_indices)
  }  
    
  # Generate data as exact copies of current minority class data
  if (num_samples > 0) {
    random_minority_indices <- sample(minority_class_indices, num_samples, replace = TRUE)
    output_matrix <- input_matrix[random_minority_indices, ]
  }
    
  # Append generated data to current data
  if (!only_generated_data) {
    output_matrix <- rbind(input_matrix, output_matrix)
  }
    
  return(output_matrix)
  
}