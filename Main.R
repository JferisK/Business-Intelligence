main <- function(){
  print("------Initialize Config------")

  #Pakete Ladem
  source("config/LoadLibraries.R")
  loadLibraries()
  
  #Daten Laden
  source("config/LoadData.R")
  loadData()
  
  #Farben laden
  source("config/Colors.R")
  
  print("------Finish Inizialisation------")
  
}
main()
