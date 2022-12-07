loadLibraries <- function(){
  
  #Pakete
  libraries <- c("readr","party","rgl","ROCR","ISLR")
  
  #Durch Pakete iteriern und aktivieren
  for (l in libraries){
    library(l,character.only = TRUE)
  }
}
loadLibraries()