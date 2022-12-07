main <- function(){
  print("------Initialize Config------")

  #Pakete Ladem
  source("config/LoadLibraries.R")
  
  #Daten Laden
  source("config/LoadData.R")
  
  #Farben laden
  source("config/Colors.R")
  loadColors()
  
  print("------Finish Inizialisation------")
  
}
main()
