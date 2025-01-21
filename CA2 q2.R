# Install and load necessary packages
install.packages("mlbench")
install.packages("rpart")
install.packages("caret")

library(mlbench)
library(rpart)
library(caret)

data("Glass")
str(Glass)
set.seed(123)

trainIndex <- createDataPartition(Glass$Type, p = .8, 
                                  list = FALSE,times = 1)
GlassTrain <- Glass[trainIndex, ]
GlassTest <- Glass[-trainIndex, ]

model <- rpart(Type ~ ., data = GlassTrain)
predictions <- predict(model, GlassTest, type = "class")

confusionMatrix <- confusionMatrix(predictions, GlassTest$Type)
print(confusionMatrix)

accuracy <- confusionMatrix$overall['Accuracy']
cat("Accuracy of the decision tree model:", accuracy, "\n")

cross_table <- table(Actual = GlassTest$Type, Predicted = predictions)
print(cross_table)

