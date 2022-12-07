library("readr")
library("party")
library("rgl")
#data<- read_csv("c:\\data\\DatenAufgabe1.csv")
data$Fehler <- as.factor(data$Fehler)
data$XKlasse <- as.factor(data$XKlasse)
data$LScore <- as.factor(data$LScore)




#Trainings und Testdaten splitten
index <- sample(1:nrow(data),size = (nrow(big4)*0.8))
train_data <- data[index,]
test_data <- data[-index,]


#predict
model <- lm(Farbreinheit~Durchmesser+Hoehe+Gewicht, train_data)
pred_test <- predict(model, test_data)
farbreinheit <- test_data$Farbreinheit


#Visualisierung
plot(x=farbreinheit,xlab="Farbreinheit", y=pred_test, ylab="Vorhergesagte Farbreinheit", col="red")
points(seq(1.0, 2.0), col= lineColor, type="l")


# ToDo Mean Error

# Ein oder zwei Parameter prüfen 

#      TESTEN
#testen auf abhängigkeit von Durchmesser 
#-> keine Abhängigkeit erkennbar
plot(x=data$Durchmesser,xlab="Durchmesser",y=data$Farbreinheit,ylab="Farbreinheit", col=red)

#testen auf abhänigkeit von Gewicht
#-> je mehr Gewicht desto schlechter aber zu starke Streuung
plot(data$Gewicht, data$Farbreinheit)

#testen auf abhänigkeit von Hoehe
#-> keine Abhänigkeit erkennbar
plot(data$Hoehe, data$Farbreinheit)