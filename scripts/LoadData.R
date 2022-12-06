loadData <- function(ran_seed =42, train_split=0.8){
  
  #Daten einlesen
  data <- read_csv("./data/SmartBuild.csv")
  
  
  #
  index <- sample(1:nrow(data),nrow(data)*0.8)
  
  train_data <- data[index,]
  test_data <- data[-index,]
}