# Loading necessary libraries
library(MASS)       # For the Boston dataset
library(neuralnet)  # For neural network

# Setting seed for reproducibility
set.seed(123)

# Load the Boston dataset
dataset <- Boston

# Display the structure of the dataset
str(dataset)

# Help on the Boston dataset
help("Boston")

# Plot histogram of the 'medv' (median value of homes) variable
hist(dataset$medv)

# Get the dimensions of the dataset
dim(dataset)

# Check the first 5 rows of the dataset
head(dataset, 5)

# Get the range of each column
apply(dataset, 2, range)

# Scaling the dataset: Min-Max scaling
maxval <- apply(dataset, 2, max)
minval <- apply(dataset, 2, min)
Dataframe <- as.data.frame(scale(dataset, center = minval, scale = maxval - minval))

# Split dataset into training and testing sets
new <- sample(1:nrow(Dataframe), 400)  # Randomly select 400 rows for training
trainset <- Dataframe[new, ]
testset <- Dataframe[-new, ]

# Prepare formula for neural network
allavr <- colnames(Dataframe)
predictvar <- allavr[!allavr %in% "medv"]  # All variables except 'medv'
predictvar <- paste(predictvar, collapse = "+")  # Create the formula for neural network
form <- as.formula(paste("medv ~", predictvar))

# Build the neural network model
newmodel <- neuralnet(formula = form, hidden = c(4, 2), linear.output = TRUE, data = trainset)

# Plot the neural network model
plot(newmodel)

# Make predictions on the test set
pred <- compute(newmodel, testset[, 1:13])  # Predict on the 13 predictor variables
prediction <- pred$net.result * (max(testset$medv) - min(testset$medv)) + min(testset$medv)  # Rescale predictions

# Actual values (rescaled)
actualvalue <- testset$medv * (max(testset$medv) - min(testset$medv)) + min(testset$medv)

# Calculate Mean Squared Error (MSE)
MSE <- sum((prediction - actualvalue)^2) / nrow(testset)  # Corrected MSE calculation
MSE

# Plot actual vs predicted values
plot(testset$medv, prediction, col = 'blue', main = "Actual vs Prediction", pch = 1, cex = 0.9,
     xlab = "Actual", ylab = "Predicted")

