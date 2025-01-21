# Single Regression using 'women' dataset
data("women")

# Fit a linear regression model
LINERMODEL <- lm(weight ~ height, data=women)
summary(LINERMODEL)

# Scatter plot with regression line
plot(women$height, women$weight, main="Scatterplot: Height vs Weight",
     xlab="Height", ylab="Weight")
abline(LINERMODEL, col="red", lwd=3)

# Make a prediction for height = 62
checkWEIGHT <- data.frame(height=62)
result <- predict(LINERMODEL, checkWEIGHT)
print(result)

# Multiple Regression using 'mtcars' dataset
data("mtcars")

# Fit a multiple regression model: Predicting 'mpg' using 'wt' and 'hp'
MULTIREGMODEL <- lm(mpg ~ wt + hp, data=mtcars)
summary(MULTIREGMODEL)

# Make a prediction for specific wt and hp values
checkCARS <- data.frame(wt=3.0, hp=110) # Example input
result_multi <- predict(MULTIREGMODEL, checkCARS)
print(result_multi)

# Scatter plot with regression line for 'wt' vs 'mpg'
plot(mtcars$wt, mtcars$mpg, main="Scatterplot: Weight vs MPG",
     xlab="Weight", ylab="Miles Per Gallon (MPG)")
abline(lm(mpg ~ wt, data=mtcars), col="blue", lwd=2)

