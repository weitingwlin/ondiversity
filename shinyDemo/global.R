

richness <- function(A){
  return(length(unique(A[!is.na(A)])))
}

simpsonIER <- function(A){
  TA <- table(A[!is.na(A)])
  N <- sum(TA)          
  IER <-(1 - sum((TA / N) ^ 2)) * N / (N - 1)
  return(IER)
}  