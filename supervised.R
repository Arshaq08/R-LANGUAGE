# Load necessary libraries
install.packages("e1071")
install.packages("mlbench")
install.packages("class")
install.packages("rpart")
install.packages("rpart.plot")
install.packages("nnet")
install.packages("ggplot2")

library(e1071)
library(mlbench)
library(class)
library(rpart)
library(rpart.plot)
library(nnet)
library(ggplot2)

# Load dataset
data("PimaIndiansDiabetes")
set.seed(123)

# Splitting the dataset
index <- sample(1:nrow(PimaIndiansDiabetes), 0.7 * nrow(PimaIndiansDiabetes))
train <- PimaIndiansDiabetes[index, -9]
test <- PimaIndiansDiabetes[-index, -9]
trainl <- PimaIndiansDiabetes[index, 9]
testl <- PimaIndiansDiabetes[-index, 9]

# 1. KNN
knnn <- knn(train, test, trainl, k = 2)
cf_knn <- table(knnn, testl)
accuracy_knn <- sum(diag(cf_knn)) / sum(cf_knn)
accuracy_knn
# 2. Naive Bayes
nb_model <- naiveBayes(diabetes ~ ., data = PimaIndiansDiabetes[index, ])
nb_pred <- predict(nb_model, PimaIndiansDiabetes[-index, ])
cf_nb <- table(nb_pred, testl)
accuracy_nb <- sum(diag(cf_nb)) / sum(cf_nb)
accuracy_nb
# 3. Decision Tree
dt_model <- rpart(diabetes ~ ., data = PimaIndiansDiabetes[index, ])
dt_pred <- predict(dt_model, PimaIndiansDiabetes[-index, ], type = "class")
cf_dt <- table(dt_pred, testl)
rpart.plot(dt_model)
accuracy_dt <- sum(diag(cf_dt)) / sum(cf_dt)
accuracy_dt
# 4. Single Regression
sr_model <- lm(glucose ~ age, data = PimaIndiansDiabetes[index, ])
sr_pred <- predict(sr_model, PimaIndiansDiabetes[-index, ])
ggplot(PimaIndiansDiabetes, aes(x = age, y = glucose)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, col = "red") +
  ggtitle("Single Regression: Age vs Glucose")

# 5. Multiple Regression
mr_model <- lm(glucose ~ ., data = PimaIndiansDiabetes[index, ])
mr_pred <- predict(mr_model, PimaIndiansDiabetes[-index, ])
ggplot(data.frame(Predicted = mr_pred, Observed = PimaIndiansDiabetes[-index, ]$glucose),
       aes(x = Predicted, y = Observed)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, col = "blue") +
  ggtitle("Multiple Regression: Predicted vs Observed Glucose")

# 6. SVM
svm_model <- svm(diabetes ~ ., data = PimaIndiansDiabetes[index, ])
svm_pred <- predict(svm_model, PimaIndiansDiabetes[-index, ])
cf_svm <- table(svm_pred, testl)
accuracy_svm <- sum(diag(cf_svm)) / sum(cf_svm)
accuracy_svm
# 7. Neural Network
# Convert diabetes column to factor for classification
PimaIndiansDiabetes$diabetes <- as.factor(PimaIndiansDiabetes$diabetes)
nn_model <- nnet(diabetes ~ ., data = PimaIndiansDiabetes[index, ], size = 5, maxit = 200)
nn_pred <- predict(nn_model, PimaIndiansDiabetes[-index, ], type = "class")
cf_nn <- table(nn_pred, testl)
accuracy_nn <- sum(diag(cf_nn)) / sum(cf_nn)
accuracy_nn
# Print accuracies
cat("Accuracy of KNN:", accuracy_knn, "\n")
cat("Accuracy of Naive Bayes:", accuracy_nb, "\n")
cat("Accuracy of Decision Tree:", accuracy_dt, "\n")
cat("Accuracy of SVM:", accuracy_svm, "\n")
cat("Accuracy of Neural Network:", accuracy_nn, "\n")
