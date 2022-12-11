test <- data.frame(Hoehe=seq(min(test_data$Hoehe), max(test_data$Hoehe), length.out=nrow(test_data)))

# Create Models
polModel <- lm(Gammawert~poly(Hoehe, 2, raw=T), train_data)
linModel <- lm(Gammawert~Hoehe, train_data)

# Create Visualisation
plot(train_data$Hoehe, 
     train_data$Gammawert, 
     col = orange, 
     xlab = "Höhe", 
     ylab = "Gammawert",
     bg = NA)
 
points(test$Hoehe, 
       predict(polModel, test), 
       col = lineColor, 
       type = "l",
       bg = NA)

# Evaluation
polErr      <- mean(abs(predict(polModel, test_data) - test_data$Gammawert))
linErr      <- mean(abs(predict(linModel, test_data) - test_data$Gammawert))
baselineErr <- mean(abs(mean(train_data$Gammawert)- test_data$Gammawert))

plot(x=test_data$Gammawert, 
     xlab = "Gammawert", 
     y = predict(polModel, test_data), 
     ylab = "Vorhergesagter Gammawert", 
     col = orange,
     bg = NA)


points(seq(0, 1000), 
       col = lineColor, 
       type = "l",
       bg = NA)
