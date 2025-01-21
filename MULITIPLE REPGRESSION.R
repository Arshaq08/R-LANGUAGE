
# Load the airquality dataset
data("airquality")
View(data)
# Inspect the dataset
help(airquality)
head(airquality)

# Attach the airquality dataset to the search path
attach(airquality)

# Fit the linear regression model
reg <- lm(Ozone ~ Solar.R + Wind + Temp, data = airquality)

# Summary of the regression model
summary(reg)

# Get the names of the components in the regression model
names(reg)

# Plot of the fitted values and residuals
plot(reg$fitted.values + reg$residuals ~ reg$fitted.values,
     xlab = "Fitted Values",
     ylab = "Fitted + Residuals",
     main = "Fitted vs Fitted + Residuals")
abline(0, 1, col = 2, lwd = 3)  # Add a diagonal line




---------------------------------------------------------------------------------------------------

  
  
  
# Load the ggplot2 library
library(ggplot2)

# Load and view the airquality dataset
data("airquality")
View(airquality)

# Assign airquality to a new variable
aq <- airquality

# Summary of the dataset
summary(aq)

# Fix NA values for Ozone and Solar.R
aq$Ozone[is.na(aq$Ozone)] <- mean(aq$Ozone, na.rm = TRUE)
aq$Solar.R[is.na(aq$Solar.R)] <- mean(aq$Solar.R, na.rm = TRUE)

# Normalize the columns using a custom function
nor <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}

# Normalize the first four columns and update the dataset
aq_norm <- as.data.frame(lapply(aq[c(1, 2, 3, 4)], nor))
aq[c(1, 2, 3, 4)] <- aq_norm

# Attach the modified airquality dataset
attach(aq)

# Fit a multiple linear regression model
multi <- lm(Ozone ~ Solar.R + Wind + Temp, data = aq)

# Summary of the regression model
summary(multi)

# Check attributes of the model
attributes(multi)

# Create a new data frame for prediction
checkOzone <- data.frame(Solar.R = 150, Wind = 9, Temp = 80)

# Predict Ozone for the new data
result <- predict(multi, checkOzone)
result

# Plot 1: Ozone vs Fitted values from the model
plot(Ozone ~ multi$fitted.values,
     xlab = "Fitted Values",
     ylab = "Ozone",
     main = "Ozone vs Fitted Values")
abline(0, 1, col = 5, lwd = 3)  # Adds a diagonal line for reference

# Plot 2: Fitted values + residuals vs Fitted values
plot(multi$fitted.values + multi$residuals ~ multi$fitted.values,
     xlab = "Fitted Values",
     ylab = "Fitted + Residuals",
     main = "Fitted + Residuals vs Fitted Values")
abline(0, 1, col = 5, lwd = 3)  # Adds a diagonal line for reference

