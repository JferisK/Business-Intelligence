
# Decision Tree erstellen
Dec_Tree <- ctree(XKlasse~Gewicht+Hoehe+Durchmesser, data=train_data)
plot(Dec_Tree)

# Evaluation der Trainingsdaten
res <- predict(Dec_Tree, test_data)
table(Vohergesagt = res, Tatsächlich=test_data$XKlasse)


# Genauigkeit berechnen
accurancy = sum(test_data$XKlasse==res)/nrow(test_data) * 100
cat("Genauigkeit:",accurancy)
