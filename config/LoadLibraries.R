loadLibraries <- function(){
  
  #Pakete
  libraries <- c("readr","party","rgl","ROCR","ISLR")
  
  #Durch Pakete iteriern und aktivieren
  for (l in libraries){
    print(paste("Checking package:", l))
    
    # Prüfung ob Package vorhanden ist
    if (system.file(package=l) == ""){
      print(paste("Installing package:", l))
      install.packages(l)
    } 
    
    # aktiviert package
    library(l,character.only = TRUE)
  }
}
loadLibraries()
