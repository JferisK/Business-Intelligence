loadLibraries <- function(){
  
  libraries <- c("readr","party","rgl")
  
  for (l in libraries){
    library(l,character.only = TRUE)
  }
}
loadLibraries()