# Functions to generate data
gen_seq_data <- function(num_samples, num_features, num_queries, random_seed) {
  
  # Generates a matrix and random queries indices. Every row of the 
  # matrix is a vector of dimension equal to numFeatures and a
  # constant value equal to the row number. The matrix rows are
  # shuffled such that the performance results of the nearest
  # neighbours algorithm do not depend on the particular structure
  # of the generated matrix.
  #
  # Args:
  #   num_samples: The number of rows for the generated matrix.
  #   num_features: The number of columns for the generated matrix.
  #   num_queries: the number of rows of the query matrix.
  #   random_seed: The random state used in sample functions.
  #
  # Returns:
  #   A list which contains the input_matrix and the query_matrix.
  
  # Set random state
  set.seed((random_seed))
  
  # Create sequential matrix
  input_matrix <- matrix(rep(1:num_samples), num_features, nrow = num_samples)
  
  # Shuffle matrix rows
  shuffled_indices <- sample(num_samples)
  input_matrix <- input_matrix[shuffled_indices, ]
  
  # Choose a random query matrix
  queries_indices <- sample(num_samples, num_queries)
  query_matrix <- inputMatrix[queries_indices, , drop = FALSE]
  
  return(list(input_matrix = input_matrix, query_matrix = query_matrix))
}
