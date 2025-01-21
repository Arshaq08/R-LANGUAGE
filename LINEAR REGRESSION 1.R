# Load the data
data <- read.csv(file.choose(), sep=',', header=T)

# Inspect the data
names(data)
summary(data)

# Check and convert Age to numeric
class(data$Age)
data$Age = as.numeric(data$Age)
class(data$Age)

# Create a scatter plot
plot(data$Age, data$LungCap, main="Scatterplot")

# Fit a linear model
LINERMODEL = lm(LungCap ~ Age, data=data)
summary(LINERMODEL)

# Add the regression line to the plot
abline(LINERMODEL, col=2, lwd=3)

# Make predictions for Age = 12
checkLUNGS = data.frame(Age=12)
result = predict(LINERMODEL, checkLUNGS)
result
CARS)

