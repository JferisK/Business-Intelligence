#LScore

model_LScore <- ctree(LScore~ Gewicht + Hoehe,data=train_data)
res_test <- predict(model_LScore,test_data)

accuracy_all <- sum(test_data$LScore == res_test)/nrow(test_data)
# 0.9325

table(original=test_data$LScore,predicted=res_test)
#predicted
#original   gut mittel schlecht
#gut      160     41       12
#mittel     0    731       20
#schlecht   1     61      974