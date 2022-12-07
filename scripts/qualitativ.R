library("readr")
library("party")
library("rgl")
data<- read_csv("c:\\data\\DatenAufgabe1.csv")
data$Fehler <- as.factor(data$Fehler)
data$XKlasse <- as.factor(data$XKlasse)
data$LScore <- as.factor(data$LScore)

#Ab x und größer zählt ein Teil als qualitativ
x<- 1.7


data$qualitativ <- ifelse(data$Qualitaet >= x, "Ja", "Nein")
data$qualitativ <- as.factor(data$qualitativ)


data <- data.frame(data)
#Trainings und Testdaten splitten
index <- sample(1:nrow(data),size = (nrow(data)*0.8))
train_data <- data[index,]
test_data <- data[-index,]

treeModel <- ctree(qualitativ~Hoehe+Durchmesser+Gewicht, train_data)
predict <- predict(treeModel, test_data)

table(pred = predict, real = test_data$qualitativ)
mean(predict==test_data$qualitativ)