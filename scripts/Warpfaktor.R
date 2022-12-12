
#Visulaisierung zur Übersicht
plot(train_data$Gewicht, xlab="Gewicht", train_data$Warpfaktor, ylab = "Warpfaktor", col=orange)


#minimal besseres Ergebnis mit Polynom 10. Grades
deg = 10 

#Linear Regression Model erstellen
model_g <- lm(Warpfaktor~poly(Gewicht, deg), train_data)

#Warpfaktor vorhersagen
res_g <- predict(model_g, test_data)

#Error berechnen
err <- mean(abs(res_g-test_data$Warpfaktor))
cat("Testerror: ", err)

baseError <- mean(abs(mean(train_data$Warpfaktor) - test_data$Warpfaktor))
cat("Baselineerror: ", baseError)


#Visualisierung
plot(x=test_data$Warpfaktor, xlab="Warpfaktor",
     y=res_g, ylab="Vorhergesagter Warpfaktor", col=orange)
points(seq(0, 500), col=lineColor, type="l")















