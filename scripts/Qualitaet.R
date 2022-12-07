
library("readr")
library("party")
library("rgl")
#data<- read_csv("c:\\data\\DatenAufgabe1.csv")
data$Fehler <- as.factor(data$Fehler)
data$XKlasse <- as.factor(data$XKlasse)
data$LScore <- as.factor(data$LScore)
data$qualitativ <- ifelse(data$Qualitaet >= 1.5, "Ja", "Nein")

#Durchmesser, Hoehe, Gewicht und Quali
big4 <- data[ , c(2,3,4,5)]

#Trainings und Testdaten splitten
index <- sample(1:nrow(big4),size = (nrow(big4)*0.2))
train_data <- big4[index,]
test_data <- big4[-index,]


#predict
model <- lm(Qualitaet~Durchmesser+Hoehe+Gewicht, train_data)
pred_test <- predict(model, test_data)
qualitaet <- test_data$Qualitaet


#Visualisierung
plot(x=qualitaet,xlab=" Quali", y=pred_test, ylab="Vorhergesagte Quali", col="red")
points(seq(1.0, 2.0), col="blue", type="l")


#test error
#2,1% sieht gut aus
pred_test <- predict(model, test_data)
mean(abs(pred_test - test_data$Qualitaet))

#train error
#unterschied zwischen test- und trainingsdaten sehr gering was gut ist
pred_train<- predict(model,train_data)
mean(abs(pred_train - train_data$Qualitaet))

#baseline error
#keine Option
baseline<- mean(train_data$Qualitaet)
mean(abs(baseline-test_data$Qualitaet))




#      TESTEN
#testen auf abhängigkeit von Durchmesser 
#-> keine Abhängigkeit erkennbar
plot(big4$Durchmesser, big4$Qualitaet)

#testen auf abhänigkeit von Gewicht
#-> je mehr Gewicht desto schlechter aber zu starke Streuung
plot(big4$Gewicht, big4$Qualitaet)

#testen auf abhänigkeit von Hoehe
#-> keine Abhänigkeit erkennbar
plot(big4$Hoehe, big4$Qualitaet)



colors = c("green","blue","pink")
palette(colors)
#alle Attribute 
plot3d(big4$Durchmesser, big4$Gewicht, big4$Hoehe, 
       col=ifelse(big4$Qualitaet > 0.5, 1, 2))




treeModel <- ctree(Qualitaet~Hoehe+Durchmesser+Gewicht, train_data)
predict <- predict(treeModel, test_data)

table(pred = predict, real = test_data$IstQualitativ)






