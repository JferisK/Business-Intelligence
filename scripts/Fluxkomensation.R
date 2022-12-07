#LScore
source("scripts/LoadData.R")
loadLibraries()
source("scripts/LoadLibraries.R")
loadData()


#mit polynom5 bestes Ergebnis bisher
flux_model <- lm(Fluxkomensation~Gewicht+poly(Hoehe, 5, raw=T),train_data)

pred_test <- predict(flux_model,test_data)

err_test <- mean(abs(pred_test - test_data$Fluxkomensation))
err_test
#1.620384

#Visualisierung
plot(pred_test,test_data$Fluxkomensation)

points(c(300,1000),c(300,1000), col="red", type="l",lwd=2)
