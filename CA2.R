# Load necessary package
library(ggplot2)

# Load the mtcars dataset
data(mtcars)

# Model 1: Predict mpg using wt
model1 <- lm(mpg ~ wt, data = mtcars)
summary(model1)

# Plotting Model 1
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", color = "blue") +
  labs(title = "MPG vs Weight", x = "Weight (wt)", y = "Miles Per Gallon (mpg)")

# Model 2: Predict mpg using wt, hp, and drat
model2 <- lm(mpg ~ wt + hp + drat, data = mtcars)
summary(model2)

# Plotting Model 2
par(mfrow = c(1, 3)) # Arrange plots in a single row

# Plot for wt
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", color = "blue") +
  labs(title = "MPG vs Weight", x = "Weight (wt)", y = "Miles Per Gallon (mpg)")

# Plot for hp
ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "MPG vs Horsepower", x = "Horsepower (hp)", y = "Miles Per Gallon (mpg)")

# Plot for drat
ggplot(mtcars, aes(x = drat, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", color = "green") +
  labs(title = "MPG vs Rear Axle Ratio", x = "Rear Axle Ratio (drat)", y = "Miles Per Gallon (mpg)")