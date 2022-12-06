#Aufgabe 1 BI
library(readr)
library(party)

#LScore
source("scripts/LoadData.R")

loadData()

model_LScore <- ctree(LScore~ Gewicht + Durchmesser + Hoehe,data=train_data)
res_test <- predict(model_LScore,test_data)

accuracy_all <- sum(test_data$LScore == res_test)/nrow(test_data)
table(test_data$LScore,res_test)
