random_oversampling <- function(input_matrix, num_samples = NULL, only_generated_data = TRUE) {
  
  # Dataset parameters
  num_columns <- ncol(input_matrix)
  target_column <- input_matrix[, num_columns]
  minority_class_indices = which(target_column == 1)
  majority_class_indices = which(target_column == 0)
  
  if (length(unique(target_column)) == 2) {
    
    # Create default value for num_samples
    if (is.null(num_samples)) {
      num_samples = length(majority_class_indices) - length(minority_class_indices)
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
  else {
    message("Not a binary variable set as target")
  }
  
}