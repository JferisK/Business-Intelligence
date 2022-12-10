
treeModel <- ctree(Fehler ~Hoehe+Durchmesser+Gewicht, train_data)

results <- predict(treeModel, test_data)
table(pred = results, real = test_data$Fehler)
                            #real
#pred                        Ausschuss Fehler im Toleranzbereich nein
#Ausschuss                       775                       204  188
#im Toleranzbereich                0                         0    0
#nein                             27                         9  797


accuracy <- mean(results == test_data$Fehler)
accuracy
# 0.786

plot(treeModel)


