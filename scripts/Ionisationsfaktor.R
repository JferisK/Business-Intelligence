#Ionisationsfaktor

#mit polynom 3 bestes Ergebnis
pol_model <- lm(Ionisationsfaktor~poly(Hoehe,3,raw = T)+Durchmesser,train_data)
li_model <- lm(Ionisationsfaktor~Hoehe+Gewicht+Durchmesser,train_data)

pol_pred_test <- predict(pol_model,test_data)
li_pred_test <- predict(li_model,test_data)


pol_err_test <- mean(abs(pol_pred_test - test_data$Ionisationsfaktor))
pol_err_test
#1.60666

li_err_test <- mean(abs(li_pred_test - test_data$Ionisationsfaktor))
li_err_test
#1.608022

base_err_test <- mean(abs(mean(train_data$Ionisationsfaktor)- test_data$Ionisationsfaktor))
base_err_test
#2.335094

#Visualisierung
plot(test_data$Ionisationsfaktor,
     pol_pred_test,
     xlab ="Ionisationsfaktor",
     ylab = "Vorhergesagter Ionisationsfaktor",
     col=orange)

points(seq(0,40),
       lwd=2,
       col=lineColor,
       type="l")

plot(train_data$Hoehe,
     train_data$Ionisationsfaktor,
     col = orange, 
     xlab = "Höhe", 
     ylab = "Ionisationsfaktor")

points(test_data$Hoehe, 
       pol_pred_test, 
       col = lineColor, 
       lwd = 1)