#Clustern
#Normalisieren
data <- scale(full_data[,c(2,3,4)])

data <- data.frame(data)

#Modell erstellen
model <- kmeans(data,2)
#Visualisierung
plot3d(data$Durchmesser,data$Hoehe,data$Gewicht,col=model$cluster)

# ->Keine sinvollen Cluster erkennbar