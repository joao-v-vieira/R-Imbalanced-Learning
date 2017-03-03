check_binary<- function(input_matrix){
  levels <-as.matrix(unique(input_matrix[,ncol(input_matrix)]))
  first<- levels[1,1]
  second<- levels[2,1]
  minority <- subset(input_matrix, input_matrix[,ncol(input_matrix)]==first)
  majority <- subset(input_matrix, input_matrix[,ncol(input_matrix)]==second)
  
  if(first != 0) {
    for(first in minority[,ncol(input_matrix)])
      minority[,ncol(input_matrix)]=0
  }
  
  if (second != 1){
    for(second in majority[,ncol(input_matrix)])
      majority[,ncol(input_matrix)]=1
  }
  return(rbind(minority,majority))
}   