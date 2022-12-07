set.seed(42)
library("readr")
library("party")
library("rgl")
data<- read_csv("c:\\data\\DatenAufgabe1.csv")
data$Fehler <- as.factor(data$Fehler)
data$XKlasse <- as.factor(data$XKlasse)
data$LScore <- as.factor(data$LScore)

data$Ausschuss <- ifelse(data$Fehler == "Ausschuss", "Ja", "Nein")
data$Ausschuss <- as.factor(data$Ausschuss)

data <- data.frame(data)
#Trainings und Testdaten splitten
index <- sample(1:nrow(data),size = (nrow(big4)*0.8))
train_data <- data[index,]
test_data <- data[-index,]


treeModel <- ctree(as.factor(Ausschuss) ~ Gewicht+Hoehe+Durchmesser, train_data)
plot(treeModel)


predictions <- predict(treeModel, test_data)

table(pred = predictions, real = test_data$Ausschuss)
#      real
# pred    Ja   Nein
# Ja      692  313
# Nein    110  885

mean(predictions == test_data$Ausschuss)
# 78.85%

