#Aufgabe 1 BI
library(readr)
library(party)

#LScore
set.seed(42)
data <- read_csv("SmartBuild.csv")
data$LScore <- as.factor(data$LScore)
index <- sample(1:nrow(data),nrow(data)*0.8)

train_data <- data[index,]
test_data <- data[-index,]

model_LScore <- ctree(LScore~ Gewicht + Durchmesser + Hoehe,data=train_data)
res_test <- predict(model_LScore,test_data)

accuracy_all <- sum(test_data$LScore == res_test)/nrow(test_data)
table(test_data$LScore,res_test)
