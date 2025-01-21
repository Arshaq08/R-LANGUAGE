
data <- read.csv(file.choose())
View(data)
summary(data)


data$diagnosis <- as.factor(data$diagnosis)



# Split the data into training and test sets
set.seed(123)  # For reproducibility
ran <- sample(1:nrow(data), 0.9 * nrow(data))
train <- data[ran, ]
test <- data[-ran, ]
trainlabel <- train$diagnosis
testlabel <- test$diagnosis

# Standardize the feature columns (excluding the diagnosis column)
train_scaled <- scale(train[ , -which(names(train) == "diagnosis")])
test_scaled <- scale(test[ , -which(names(test) == "diagnosis")])

# Load the class library and apply k-NN
library(class)
re <- knn(train = train_scaled, test = test_scaled, cl = trainlabel, k = 20)

# Create the confusion matrix
tb <- table(predicted = re, actual = testlabel)

# Define and calculate accuracy
accuracy <- function(x) { sum(diag(x)) / sum(x) * 100 }
accuracy(tb)
