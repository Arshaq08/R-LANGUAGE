install.packages("rpart")
library("rpart")
data("iris")
str(iris)
indexes = sample(150, 110)
indexes
iris_train = iris[indexes,]
iris_train
iris_test = iris[-indexes,]
iris_test

tree = rpart(Species~., data = iris_train, method = "class")
predictions = predict(tree, iris_test,type="class")
predictions

cf<-table(iris_test$Species,predictions)
cf
accuracy=sum(diag(cf))/sum(cf)
accuracy
install.packages("rpart.plot")
library("rpart.plot")
rpart.plot(tree)

install.packages("e1071")
library(e1071)
install.packages("mlbench")
library(mlbench)
data("PimaIndiansDiabetes")
View(PimaIndiansDiabetes)
head(PimaIndiansDiabetes)
set.seed(123)
index=sample(1:nrow(PimaIndiansDiabetes),0.7*nrow(PimaIndiansDiabetes))
train=PimaIndiansDiabetes[index,]
test=PimaIndiansDiabetes[-index,]
svm_mod=svm(diabetes~mass+pressure+insulin,data=train,kernel="linear")
pre=predict(svm_mod,test)
cf=table(pre,test$diabetes)
cf
accuracy=sum(diag(cf))/sum(cf)
accuracy