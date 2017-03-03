check_binary<- function(input_matrix){
  levels <-as.matrix(unique(input_matrix[,ncol(input_matrix)]))
  first<- levels[1,1]
  second<- levels[2,1]
  minority <- subset(input_matrix, input_matrix[,5]==first)
  majority <- subset(input_matrix, input_matrix[,5]==second)
  
  if(first != 0) {
    for(first in minority[,5])
      minority[,5]=0
  }
  
  if (second != 1){
    for(second in majority[,5])
      majority[,5]=1
  }
  return(rbind(minority,majority))
}   