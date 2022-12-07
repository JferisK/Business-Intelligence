loadData <- function(ran_seed =42, train_split=0.8){
  
  #Daten einlesen
  data <- read_csv("./data/SmartBuild.csv")
  
  
  #factoren setzen
  data$LScore <- as.factor(data$LScore)
  data$Fehler <- as.factor(data$Fehler)
  data$XKlasse <- as.factor(data$XKlasse)
  
  
  #Train/Test aufteilen
  set.seed(ran_seed)
  index <- sample(1:nrow(data),nrow(data)*train_split)
  
  complete_data <<- data[,]
  train_data <<- data[index,]
  test_data <<- data[-index,]
}
loadData()