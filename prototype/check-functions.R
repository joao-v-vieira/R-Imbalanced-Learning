check_binary_target(target_column) {
  if (length(unique(target_column)) != 2) {
    stop("Target variable is not binary")
  }
  return(target_column)
}