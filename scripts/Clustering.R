

model <- kmeans(full_data[,c(2,3,4)],2)
plot3d(full_data$Durchmesser,full_data$Hoehe,full_data$Gewicht,col=model$cluster)