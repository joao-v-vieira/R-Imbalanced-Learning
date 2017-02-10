library(testthat)

source("../prototype/oversampling-methods.R")
input_matrix <- as.matrix(read.csv("../datasets/iris.csv"))

test_that("Test output", {
  
  # Input parameters
  input_col_number <- ncol(input_matrix)
  
  # Ouput parameters
  output_matrix <- over_sampling(input_matrix, 20)
  output_col_number <- ncol(output_matrix)
  output_row_number <- nrow(output_matrix)
  
  # Helper functions
  is_row_in_matrix <- function(test_row, reference_matrix) {
    return(any(apply(reference_matrix, 1, function(matrix_row) identical(test_row, matrix_row))))
  }
  
  # Tests
  expect_is(output_matrix, "matrix")
  expect_equal(output_col_number, input_col_number)
  expect_equal(output_row_number, 20)
  expect_equal(unique(output_matrix[, output_col_number]), 1)
  expect_true(all(apply(output_matrix, 1, function(row) is_row_in_matrix(row, input_matrix))))
})

