loadData <- function(ran_seed =42, train_split=0.8){
  
  #Daten einlesen
  complete_data <- read_csv("./data/SmartBuild.csv")
  
  
  #factoren setzen
  complete_data$LScore <- as.factor(complete_data$LScore)
  complete_data$Fehler <- as.factor(complete_data$Fehler)
  complete_data$XKlasse <- as.factor(complete_data$XKlasse)
  
  
  #Train/Test aufteilen
  set.seed(ran_seed)
  index <- sample(1:nrow(complete_data),nrow(complete_data)*train_split)
  
  dataFrame <- data.frame(complete_data)
  
  #Variablen Global deklarieren
  
  full_data <<- dataFrame
  train_data <<- complete_data[index,]
  test_data <<- complete_data[-index,]
}
loadData()