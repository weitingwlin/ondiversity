

richness <- function(A){
  return(length(unique(A[!is.na(A)])))
}

simpsonIER <- function(A){
  TA <- table(A)
            
  
}  