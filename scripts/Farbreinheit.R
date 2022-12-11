#Farbreinheit

#predict
model_Farbreinheit <- lm(Farbreinheit~Durchmesser+Hoehe+Gewicht, train_data)
pred_test <- predict(model_Farbreinheit, test_data)
farbreinheit <- test_data$Farbreinheit


#Visualisierung
plot(x=farbreinheit,
     xlab="Farbreinheit", 
     y=pred_test, 
     ylab="Vorhergesagte Farbreinheit", 
     col="red",
     cex=1,
     pch=20)

error <- mean(abs(pred_test - test_data$Farbreinheit))
error
baselineErr <- mean(abs(mean(train_data$Farbreinheit)- test_data$Farbreinheit))
baselineErr


plot(x=farbreinheit,xlab="Farbreinheit", y=pred_test, ylab="Vorhergesagte Farbreinheit", col=orange,cex=1,pch=20)

accuracy_all <- sum(farbreinheit == pred_test)/nrow(test_data)

# ToDo Mean Error

# Ein oder zwei Parameter prüfen 

#      TESTEN
#testen auf abhängigkeit von Durchmesser 
#-> keine Abhängigkeit erkennbar
plot(full_data$Durchmesser,full_data$Farbreinheit)

#testen auf abhänigkeit von Gewicht
#-> je mehr Gewicht desto schlechter aber zu starke Streuung
plot(full_data$Gewicht, full_data$Farbreinheit)

#testen auf abhänigkeit von Hoehe
#-> keine Abhänigkeit erkennbar
plot(full_data$Hoehe, full_data$Farbreinheit)




