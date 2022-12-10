set.seed(42)

#Dataframe kopieren
data_aus <- data.frame(full_data)

#spalte Ausschuss hinzufügen
data_aus$Ausschuss <- ifelse(data_aus$Fehler == "Ausschuss", "Ja", "Nein")
data_aus$Ausschuss <- as.factor(data_aus$Ausschuss)

#Trainings und Testdaten splitten
index_aus<- sample(1:nrow(data_aus), (nrow(data_aus)*0.8))
train_data_aus <- data_aus[index_aus,]
test_data_aus <- data_aus[-index_aus,]

# Evaluation der Trainingsdaten
model_Ausschuss <- ctree(Ausschuss~Hoehe+Durchmesser+Gewicht, train_data_aus)
predict <- predict(model_Ausschuss, test_data_aus)
table(pred = predict, real = test_data_aus$Ausschuss)


#Genauigkeit berechnen
genauigkeit = mean(predict==test_data_aus$Ausschuss)
cat("Genauigkeit:",genauigkeit*100,"%")





#Ausschuss Baum visualisieren
plot(model_Ausschuss)

#TESTEN AUF ZUSAMMENHANG MIT GEWICHT AUSGELSEN AUS TREE
Ausschuss_data = data_aus$Gewicht >= 249.942 & data_aus$Gewicht <= 299.95
Ausschuss_data = data_aus[Ausschuss_data,]

predict_mit_gewicht <- predict(model_Ausschuss, Ausschuss_data)


genauigkeit_noch_genauer =mean(predict_mit_gewicht == Ausschuss_data$Ausschuss)
cat("Genauigkeit:",genauigkeit_noch_genauer*100,"%")








