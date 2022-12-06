#LScore
source("scripts/LoadData.R")
source("scripts/LoadLibraries.R")
loadData()
loadLibraries()



model_LScore <- ctree(LScore~ Gewicht + Durchmesser + Hoehe,data=train_data)
res_test <- predict(model_LScore,test_data)

accuracy_all <- sum(test_data$LScore == res_test)/nrow(test_data)
table(original=test_data$LScore,predicted=res_test)
