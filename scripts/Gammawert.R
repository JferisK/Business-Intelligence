library(readr)

set.seed(42)
data <- read_csv("data/SmartBuild.csv")

# Daten aufteilen in 80/20 Verteilung
index       <- sample(1:nrow(data),size = (nrow(data)*0.8))
train_data  <- data[index,]
test_data   <- data[-index,]

test <- data.frame(Hoehe=seq(min(test_data$Hoehe), max(test_data$Hoehe), length.out=nrow(test_data)))

# Create Models
polModel <- lm(Gammawert~poly(Hoehe, 2, raw=T), train_data)
linModel <- lm(Gammawert~Hoehe, train_data)

# Create Visualisation
plot(train_data$Hoehe, 
     train_data$Gammawert, 
     col = 1, 
     xlab = "Höhe", 
     ylab = "Gammawert", 
     cex = 1)

points(test$Hoehe, 
       predict(polModel, test), 
       col = 2, 
       lwd = 1)

# Evaluation
polErr      <- mean(abs(predict(polModel, test_data) - test_data$Gammawert))
linErr      <- mean(abs(predict(linModel, test_data) - test_data$Gammawert))
baselineErr <- mean(abs(mean(train_data$Gammawert)- test_data$Gammawert))

plot(x=test_data$Gammawert, 
     xlab = "Gammawert", 
     y = predict(polModel, test_data), 
     ylab = "Vorhergesagter Gammawert", 
     col = 3)


points(seq(0, 1000), 
       col = 2, 
       type = "l")
