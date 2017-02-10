# Functions to time nearest neighbours algorithms

# Load packages
library(microbenchmark)

# Function to time nearest neighbours algorithm
time_algorithm <- function(input_matrix, query_matrix, k, knn_function, num_evaluations, ...) {
  
  # Calculates statistics for the execution time of a nearest 
  # neighbour algorithm that uses the knn_function for k neighbours, 
  # input_matrix as the input matrix and query_matrix as the query
  # matrix. The process is repeated num_evaluations times.
  #
  # Args:
  #   input_matrix: The input matrix.
  #   query_matrix: The query matrix.
  #   k: The number of nearest neighbours.
  #   knn_function: The nearest neighbour function.
  #   num_evaluations: The number of experiment evaluations.
  #
  # Returns:
  #   An object of class "microbenchmark".
  
  timing_results <- microbenchmark(knn_function(input_matrix, query_matrix, k, ...), times = num_evaluations)
  return(timing_results)
}