install.packages("e1071")
install.packages("caTools")
library(e1071)
library(caTools)

data(iris)
View(iris)
str(iris)
summary(iris)

set.seed(120)

index <- sample(1:nrow(iris), 0.7 * nrow(iris))
train <- iris[index, ]
test <- iris[-index, ]

model <- naiveBayes(Species ~ ., data = train)
model

pred <- predict(model, newdata = test)
pred

cm <- table(test$Species,pred)
cm

acc<-sum(diag(cm))/sum(cm)
acc
