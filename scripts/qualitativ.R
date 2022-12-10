set.seed(42)

#Ab x und größer zählt ein Teil als qualitativ
x<- 1.5

#Dataframe kopieren
data_qua <- data.frame(full_data)
class(data_qua)
data_qua <- data.frame(data_qua)

#spalte qualitativ hinzufügen
data_qua$qualitativ <- ifelse(data_qua$Qualitaet >= x, "Ja", "Nein")
data_qua$qualitativ <- as.factor(data_qua$qualitativ)

#Trainings und Testdaten splitten
index_qua<- sample(1:nrow(data_qua), (nrow(data_qua)*0.8))
train_data_qua <- data_qua[index_qua,]
test_data_qua <- data_qua[-index_qua,]


# Evaluation der Trainingsdaten
model_qualitativ <- ctree(qualitativ~Hoehe+Durchmesser+Gewicht, train_data_qua)
predict <- predict(model_qualitativ, test_data_qua)
table(pred = predict, real = test_data_qua$qualitativ)


#Genauigkeit berechnen
genauigkeit = mean(predict==test_data_qua$qualitativ)
cat("Genauigkeit:",genauigkeit*100,"%")