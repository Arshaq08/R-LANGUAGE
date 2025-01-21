library(ggplot2)
data(diamonds)
View(diamonds)
# Check the structure of the diamonds dataset to understand its components
str(diamonds)
# Get help/documentation on the diamonds dataset for more details
?diamonds


# Store the diamonds dataset as a data frame
dia <- data.frame(diamonds)
summary(dia)
str(dia)
View(dia)
# Create a random sample of row indices that is equal to 90% of the total number of rows
ran <- sample(1:nrow(dia), 0.9 * nrow(dia))

# Display the generated random indices
ran

# Define a normalization function to scale numerical data between 0 and 1
nor <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}



# Apply the normalization function to selected columns in the data frame
# We normalize only numerical columns (columns 1, 5, 6, 7, 8, 9, 10)
dia_nor <- as.data.frame(lapply(dia[, c(1, 5, 6, 7, 8, 9, 10)], nor))
summary(dia_nor)

# Extract the training dataset using the random indices (90% of the data)
dia_train <- dia_nor[ran,]

View(dia_train)
# Extract the test dataset (remaining 10% of the data)
dia_test <- dia_nor[-ran,]
View(dia_test)

# Convert the 'cut' column (2nd column) of the training dataset to a factor
# This will be our target variable for classification
dia_target <- as.factor(dia[ran, 2])
View(dia_target)

# Similarly, extract the 'cut' column of the test dataset to use for comparison
# This will be used to check the accuracy of our predictions
test_target <- as.factor(dia[-ran, 2])
View(test_target)


library(class)

# Get help/documentation on the knn function
?knn

# Apply the k-NN algorithm with k=20 to predict the 'cut' of diamonds in the test set
# dia_train: Training data
# dia_test: Test data
# dia_target: Actual 'cut' values of the training data
pr <- knn(dia_train, dia_test, cl = dia_target, k = 20)

# Create a confusion matrix to compare predicted values with actual test values
tb <- table(pr, test_target)
# View the confusion matrix
tb
# Define an accuracy function to calculate the percentage of correct predictions
accuracy <- function(x) {
  sum(diag(x) / (sum(rowSums(x)))) * 100
}
accuracy(tb)

# Now, let's apply a machine learning model to the ChickWeight dataset
data("ChickWeight")
cw <- ChickWeight
summary(cw)
ran <- sample(1:nrow(cw), 0.9 * nrow(cw))
cwtrain <- cw[ran,]
cwtest <- cw[-ran,]
cwtrainlabel <- cw[ran, 4]
cwtestlabel <- cw[-ran, 4]
library(class)
re <- knn(train = cwtrain, test = cwtest, cl = cwtrainlabel, k = 20)
tb <- table(re, cwtestlabel)
accuracy <- function(x) { sum(diag(x) / sum(x)) * 100}
accuracy(tb)
