
data <- scale(full_data[,c(2,3,4)])
data <- data.frame(data)
model <- kmeans(data,2)
plot3d(data$Durchmesser,data$Hoehe,data$Gewicht,col=model$cluster)