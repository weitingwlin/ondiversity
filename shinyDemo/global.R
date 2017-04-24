richness <- function(A){
  return(length(unique(A[!is.na(A)])))
}