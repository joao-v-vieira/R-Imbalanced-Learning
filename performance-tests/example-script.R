# Load packages and functions
library(FNN)
for (file in c("gen-data-functions.R", "time-algs-functions.R")) source(file)  # Set working directory to ImbalancedLearning/performance_tests

# Generate sequential data
seq_data <- gen_seq_data(num_samples = 10000, num_features = 10, num_queries = 5, random_seed = 1)

# Timing of algorithm
time_alg <- timealgorithm(input_matrix = seq_data$input_matrix, 
                         query_matrix = seq_data$query_matrix, 
                         k = 5,
                         knn_function = knnx.index,
                         num_evaluations = 10)