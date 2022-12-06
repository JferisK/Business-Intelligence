library(readr)

set.seed(42)
data <- read_csv("SmartBuild.csv")
data$LScore <- as.factor(data$LScore)
index <- sample(1:nrow(data),nrow(data)*0.8)

train_data <- data[index,]
test_data <- data[-index,]

#mit polynom5 bestes Ergebnis bisher
flux_model <- lm(Fluxkomensation~Gewicht+poly(Hoehe, 5, raw=T),train_data)

pred_test <- predict(flux_model,test_data)

err_test <- mean(abs(pred_test - test_data$Fluxkomensation))
err_test
#1.620384

plot(pred_test,test_data$Fluxkomensation)

