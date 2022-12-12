#Fluxkomensation

#mit polynom5 bestes Ergebnis
pol_model <- lm(Fluxkomensation~Gewicht+poly(Hoehe, 5, raw=T),train_data)
li_model <- lm(Fluxkomensation~Gewicht+Hoehe,train_data)

pol_pred_test <- predict(pol_model,test_data)
li_pred_test <- predict(li_model,test_data)

pol_err_test <- mean(abs(pol_pred_test - test_data$Fluxkomensation))
pol_err_test
#1.620384

li_err_test <- mean(abs(li_pred_test - test_data$Fluxkomensation))
li_err_test
#4.340584

base_err_test <- mean(abs(mean(train_data$Fluxkomensation)- test_data$Fluxkomensation))
base_err_test
#80.53151

#Visualisierung
plot(test_data$Fluxkomensation,
     pol_pred_test,
     xlab ="Fluxkomensation",
     ylab = "Vorhergesagter Fluxkomensation",
     col=orange)

points(seq(0,1000),
       lwd=2,
       col=lineColor,
       type="l")

plot(train_data$Hoehe,
     train_data$Fluxkomensation,
     col = orange, 
     xlab = "Höhe", 
     ylab = "Fluxkomensation")

points(test_data$Hoehe, 
       pol_pred_test, 
       col = lineColor, 
       lwd = 1)