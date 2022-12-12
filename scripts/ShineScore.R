# Model auf Basis Durchmesser trainieren
model <- lm(ShineScore~Durchmesser, train_data)

# Mean bilden + mit Baseline abgleichen
maeTest   <- mean(abs(test_data$ShineScore - predict(model, test_data)))
maeTrain  <- mean(abs(train_data$ShineScore - predict(model, train_data)))

baselineMae <- mean(abs(train_data$ShineScore - mean(train_data$ShineScore)))

#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#-0.4087  4.8313  9.9818  9.9238 14.9275 20.4356 
summary(train_data$ShineScore)


pred_test <- predict(model, test_data)
plot(x=test_data$ShineScore,xlab="ShineScore", y=pred_test, ylab="Vorhergesagte ShineScore", col=orange)