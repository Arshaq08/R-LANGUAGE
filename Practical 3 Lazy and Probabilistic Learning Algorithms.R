# Load required libraries
library('class')
library('caret')

# Load the mtcars dataset
data <- mtcars

# Convert 'am' (transmission type) to a factor
data$am <- factor(data$am)

# Descriptive statistics
mean(data$mpg)  # Average miles per gallon
summary(data)   # Summary of the dataset

# Split into training (80%) and test (20%) sets
set.seed(123)
train <- data[1:24, ]  # First 24 rows as training data
test <- data[25:32, ]  # Remaining rows as test data

# Apply k-NN (k = 3)
pred_test <- knn(train[ , -which(names(data) == "am")], 
                 test[ , -which(names(data) == "am")], 
                 cl = train$am, 
                 k = 3)

# Evaluate performance
confusion <- table(pred_test, test$am)  # Confusion matrix
accuracy <- sum(diag(confusion)) / nrow(test) * 100  # Calculate accuracy
confusionMatrix(pred_test, test$am)  # Detailed metrics



______________________________________________________________________________

# Load the mtcars dataset
data <- mtcars

# View and summarize the data
View(data)
summary(data)

# Create a binary classification target (e.g., automatic vs manual transmission)
data$am <- as.factor(data$am)  # am: 0 = automatic, 1 = manual

# Split the data into training and test sets
set.seed(123)  # For reproducibility
ran <- sample(1:nrow(data), 0.8 * nrow(data))  # 80% for training
train <- data[ran, ]
test <- data[-ran, ]
trainlabel <- train$am
testlabel <- test$am

# Standardize the feature columns (excluding the am column)
train_scaled <- scale(train[ , -which(names(train) == "am")])
test_scaled <- scale(test[ , -which(names(test) == "am")])

# Load the class library and apply k-NN
library(class)
re <- knn(train = train_scaled, test = test_scaled, cl = trainlabel, k = 3)

# Create the confusion matrix
tb <- table(predicted = re, actual = testlabel)

# Define and calculate accuracy
accuracy <- function(x) { sum(diag(x)) / sum(x) * 100 }
accuracy(tb)
