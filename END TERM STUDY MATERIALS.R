# Practical 1: Managing Data with R
# ==================================
# Load built-in dataset
data <- mtcars
View(mtcars)

# Explore the data
head(data)         # First 6 rows
summary(data)      # Summary statistics
str(data)          # Structure of the data

# Load data into different structures
vec <- c(1, 2, 3)                    # Vector
mat <- matrix(1:9, nrow = 3)         # Matrix
lst <- list(Name = "Car", Data = mtcars) # List
df <- data.frame(vec, mat[, 1])      # Data Frame
print("Data structures created successfully!")

# Practical 2: Basics of Data Preprocessing
# =========================================
# Simulate a dataset with missing values
data <- data.frame(
  Name = c("A", "B", "C", "D"),
  Age = c(25, NA, 30, 22),
  Gender = c("Male", "Female", "Male", NA)
)

# Handle missing values
data
data$Age[is.na(data$Age)] <- mean(data$Age, na.rm = TRUE)
data <- na.omit(data)  # Remove rows with NA
data
# Normalize numeric variables

data$Age <- scale(data$Age)
data$Age
# Encode categorical variables
data$Gender <- factor(data$Gender)
print(data)

# Practical 3: Lazy and Probabilistic Learning Algorithms
# ========================================================
install.packages("class")
library(class)
install.packages("e1071")
library(e1071)

# K-Nearest Neighbors (KNN)
cat("\nApplying KNN...\n")
train_data <- iris[1:100, -5]
test_data <- iris[101:150, -5]
train_labels <- iris[1:100, 5]
test_labels <- iris[101:150, 5]
predictions_knn <- knn(train_data, test_data, train_labels, k = 3)
predictions_knn
accuracy_knn <- mean(predictions_knn == test_labels)
accuracy_knn
cat("KNN Accuracy:", accuracy_knn, "\n")

# Naive Bayes
cat("\nApplying Naive Bayes...\n")
model_nb <- naiveBayes(Species ~ ., data = iris)
predictions_nb <- predict(model_nb, iris)
accuracy_nb <- mean(predictions_nb == iris$Species)
cat("Naive Bayes Accuracy:", accuracy_nb, "\n")
table(predictions_nb, iris$Species)

# Practical 4: Divide and Conquer Algorithms
# ==========================================
install.packages("rpart")
library(rpart)

model_tree <- rpart(Species ~ ., data = iris, method = "class")
plot(model_tree)
text(model_tree)

# Calculate accuracy
predictions_tree <- predict(model_tree, iris, type = "class")
predictions_tree
accuracy_tree <- mean(predictions_tree == iris$Species)

cat("Decision Tree Accuracy:", accuracy_tree, "\n")

# Practical 5: Regression Algorithms
# ===================================
cat("\nApplying Regression Algorithms...\n")

# Simple Linear Regression

cat("Simple Linear Regression...\n")
model_slr <- lm(Sepal.Length ~ Petal.Length, data = iris)
summary(model_slr)

# Plotting the data and regression line
plot(iris$Petal.Length, iris$Sepal.Length, main = "Simple Linear Regression", 
     xlab = "Petal Length", ylab = "Sepal Length", pch = 19, col = "blue")
abline(model_slr, col = "red")  # Add the regression line


# Multiple Linear Regression
cat("Multiple Linear Regression...\n")
model_mlr <- lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, data = iris)
summary(model_mlr)

# Plotting Sepal.Length vs Petal.Length
plot(iris$Petal.Length, iris$Sepal.Length, main = "Multiple Linear Regression (Petal Length vs Sepal Length)",
     xlab = "Petal Length", ylab = "Sepal Length", pch = 19, col = "green")
abline(lm(Sepal.Length ~ Petal.Length, data = iris), col = "red")  # Adding the linear model line

# Pair plot to show relationships between predictors
pairs(iris[, c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")], 
      main = "Pair Plot of Predictors", pch = 21, bg = "lightblue")



# Practical 6: Relationships Between Numeric Values
# =================================================
cat("\nAnalyzing relationships...\n")

# Correlation
correlation <- cor(iris$Sepal.Length, iris$Petal.Length)
cat("Correlation:", correlation, "\n")

# OLS Estimation
cat("OLS Estimation...\n")
model_ols <- lm(Sepal.Length ~ Petal.Length, data = iris)
summary(model_ols)

# Practical 7: Dual Supervised Learning Algorithms
# ================================================
library(nnet)
cat("\nApplying Neural Network...\n")
model_nn <- nnet(Species ~ ., data = iris, size = 3)
predictions_nn <- predict(model_nn, iris, type = "class")
accuracy_nn <- mean(predictions_nn == iris$Species)
cat("Neural Network Accuracy:", accuracy_nn, "\n")

library(e1071)
cat("Applying SVM...\n")
model_svm <- svm(Species ~ ., data = iris)
predictions_svm <- predict(model_svm, iris)
accuracy_svm <- mean(predictions_svm == iris$Species)
cat("SVM Accuracy:", accuracy_svm, "\n")

# Practical 8: Clustering Algorithms
# ===================================
library(cluster)
cat("\nApplying Clustering...\n")

# K-Means Clustering
kmeans_model <- kmeans(iris[, -5], centers = 3)
table(kmeans_model$cluster, iris$Species)

# Hierarchical Clustering
dist_matrix <- dist(iris[, -5])
hc_model <- hclust(dist_matrix)
plot(hc_model)

# Practical 9: Association Rules
# ==============================
library(arules)
data(Groceries)
cat("\nFinding Association Rules...\n")
rules <- apriori(Groceries, parameter = list(supp = 0.01, conf = 0.8))
inspect(rules[1:5])

# Practical 10: Model Performance Testing
# ========================================
library(randomForest)
cat("\nTesting Model Performance...\n")
model_rf <- randomForest(Species ~ ., data = iris, ntree = 100)
predictions_rf <- predict(model_rf, iris)
accuracy_rf <- mean(predictions_rf == iris$Species)
cat("Random Forest Accuracy:", accuracy_rf, "\n")
