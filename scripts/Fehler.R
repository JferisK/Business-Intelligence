set.seed(42)
library("readr")
library("party")
library("rgl")
data<- read_csv("c:\\data\\DatenAufgabe1.csv")
data$Fehler <- as.factor(data$Fehler)
data$XKlasse <- as.factor(data$XKlasse)
data$LScore <- as.factor(data$LScore)



data$Ausschuss <- ifelse(data$Fehler == "Ausschuss", "Ja", "Nein")
data$Fehler <- as.factor(data$Fehler)
data <- data.frame(data)
#Trainings und Testdaten splitten
index <- sample(1:nrow(data),size = (nrow(big4)*0.8))
train_data <- data[index,]
test_data <- data[-index,]



treeModel <- ctree(Fehler ~Hoehe+Durchmesser+Gewicht, train_data)

results <- predict(treeModel, test_data)
#Evaluieren und prüfen Sie Ihre Erlebnisse

table(pred = predict, real = test_data$Fehler)



accuracy <- mean(results == test_data$Fehler)
accuracy
# 0.786

plot(treeModel)