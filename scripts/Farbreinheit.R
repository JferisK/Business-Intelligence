#Farbreinheit

#predict
model_Farbreinheit <- lm(Farbreinheit~Durchmesser+Hoehe+Gewicht, train_data)
pred_test <- predict(model_Farbreinheit, test_data)
farbreinheit <- test_data$Farbreinheit


#Visualisierung
plot(x=farbreinheit,xlab="Farbreinheit", y=pred_test, ylab="Vorhergesagte Farbreinheit", col="red",cex=1,pch=20)
points(seq(0, 1), col= lineColor, type="l")

plot(x=farbreinheit,xlab="Farbreinheit", y=pred_test, ylab="Vorhergesagte Farbreinheit", col="red",cex=1,pch=20)

accuracy_all <- sum(farbreinheit == pred_test)/nrow(test_data)

# ToDo Mean Error

# Ein oder zwei Parameter prüfen 

#      TESTEN
#testen auf abhängigkeit von Durchmesser 
#-> keine Abhängigkeit erkennbar
plot(x=full_data$Durchmesser,xlab="Durchmesser",y=full_data$Farbreinheit,ylab="Farbreinheit", col=red, cex=1, pch=20)

#testen auf abhänigkeit von Gewicht
#-> je mehr Gewicht desto schlechter aber zu starke Streuung
plot(data$Gewicht, data$Farbreinheit)

#testen auf abhänigkeit von Hoehe
#-> keine Abhänigkeit erkennbar
plot(data$Hoehe, data$Farbreinheit)