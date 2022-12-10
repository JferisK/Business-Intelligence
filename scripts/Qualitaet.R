
#predict
model <- lm(Qualitaet~Durchmesser+Hoehe+Gewicht, train_data)
pred_test <- predict(model, test_data)
qualitaet <- test_data$Qualitaet


#Visualisierung
plot(x=qualitaet,
     xlab=" Qualitaet",
     y=pred_test,
     ylab="Vorhergesagte Quali",
     col=orange)
points(seq(1.0, 2.0), col= lineColor, type="l")


#test error
#0,021 sieht gut aus
pred_test <- predict(model, test_data)
mean(abs(pred_test - test_data$Qualitaet))

#baseline error
#keine Option
baseline<- mean(train_data$Qualitaet)
mean(abs(baseline-test_data$Qualitaet))


#      TESTEN
#testen auf abhängigkeit von Durchmesser 
#-> keine Abhängigkeit erkennbar
plot(full_data$Durchmesser, full_data$Qualitaet, col=orange)

#testen auf abhänigkeit von Gewicht
#-> je mehr Gewicht desto schlechter aber zu starke Streuung
plot(full_data$Gewicht, full_data$Qualitaet, col=orange)

#testen auf abhänigkeit von Hoehe
#-> keine Abhänigkeit erkennbar
plot(full_data$Hoehe, full_data$Qualitaet, col=orange)

