# ------------------------------------------------------
# Practical 4: Divide and Conquer - Decision Trees
# ------------------------------------------------------

# Step 1: Install and load necessary libraries
install.packages("rpart")
install.packages("rpart.plot")

library(rpart)
library(rpart.plot)

# Step 2: Load the Iris dataset
data(iris)
str(iris)

# Step 3: Split the data into training and testing sets
set.seed(42)  # Setting seed for reproducibility
indexes <- sample(1:nrow(iris), 0.7 * nrow(iris))  # 70% for training
iris_train <- iris[indexes, ]  # Training data
iris_test <- iris[-indexes, ]  # Testing data

# Step 4: Define the target formula and train the decision tree
target <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
tree <- rpart(target, data = iris_train, method = "class")

# Step 5: Visualize the decision tree
rpart.plot(tree)

# Step 6: Make predictions on the test set
predictions <- predict(tree, iris_test, type = "class")

# Step 7: Evaluate the model using a confusion matrix
confusion_matrix <- table(iris_test$Species, predictions)
print(confusion_matrix)

# Step 8: Calculate accuracy
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(paste("Accuracy: ", round(accuracy, 4)))

