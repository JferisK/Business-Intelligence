library(readr)

data <- read_csv("SmartBuild.csv")

# Aufteilung von Test- und Trainingsdaten
set.seed(42)
train_index <- sample(1:nrow(data), nrow(data)*0.8)
train_data <- data[train_index,]
test_data <- data[-train_index,]

# Visulaisierung zur Übersicht
plot(train_data$Gewicht, xlab="Gewicht", train_data$Warpfaktor, ylab = "Warpfaktor")


# minimal besseres Ergebnis mit Polynom 10. Grades
deg = 10 

#Linear Regression Model erstellen
model_g <- lm(Warpfaktor~poly(Gewicht, deg), train_data)

# Warpfaktor vorhersagen
res_g <- predict(model_g, test_data)

# Error berechnen
err <- mean(abs(res_g-test_data$Warpfaktor))
cat("Testerror: ", err)

baseError <- mean(abs(mean(train_data$Warpfaktor) - test_data$Warpfaktor))
cat("Baselineerror: ", baseError)


# Visualisierung
plot(x=test_data$Warpfaktor, xlab="Warpfaktor",
     y=res_g, ylab="Vorhergesagter Warpfaktor")
points(seq(0, 500), col=rgb(1,0,0,1), type="l")




