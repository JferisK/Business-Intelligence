#LScore
source("scripts/LoadData.R")
source("scripts/LoadLibraries.R")
loadData()
loadLibraries()

#mit polynom 3 bestes Ergebnis bisher
flux_model <- lm(Ionisationsfaktor~poly(Hoehe,3,raw = T)+Gewicht+Durchmesser,train_data)

pred_test <- predict(flux_model,test_data)

err_test <- mean(abs(pred_test - test_data$Ionisationsfaktor))
err_test
#1.606672

#Visualisierung
plot(pred_test,test_data$Ionisationsfaktor)
points(c(0,40),c(0,40),lwd=2,col="red",type="l")
