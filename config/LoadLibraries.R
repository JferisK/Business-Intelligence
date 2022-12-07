loadLibraries <- function(){
  
  #Pakete
  libraries <- c("readr","party","rgl","ROCR","ISLR")
  
  #Durch Pakete iteriern und aktivieren
  for (l in libraries){
    print(paste("Checking package:", l))
    
    if (system.file(package=l) == ""){
      print(paste("Installing package:", l))
      install.packages(l)
    } else {
      print(paste("Load package:", l))
      library(l,character.only = TRUE)
    }
  }
}
loadLibraries()