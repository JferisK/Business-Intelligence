library(readr)
library(party)
data = read_csv("SmartBuild.csv")

#XKlasse in Factor umwandeln
data$XKlasse <- as.factor(data$XKlasse)
class(data$XKlasse)


# Aufteilung in Test- und Trainingsdaten
set.seed(42)
train_index = sample(1:nrow(data), nrow(data)*0.8)
train_data = data[train_index,]
test_data = data[-train_index,]

# Decision Tree erstellen
Dec_Tree <- ctree(XKlasse~Gewicht+Hoehe+Durchmesser, data=train_data)
plot(Dec_Tree)

# Evaluation der Trainingsdaten
res <- predict(Dec_Tree, test_data)
table(Vohergesagt = res, Tatsächlich=test_data$XKlasse)

# Genauigkeit berechnen
accurancy = sum(test_data$XKlasse==res)/nrow(test_data)
accurancy
