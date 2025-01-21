social <- read.csv("D:/SEMISTER 5/INT234 PREDICTIVE ANALYTICS/AFTER MID/social.csv")
View(social)
social <- social[-1]
library(caTools)
# Split the data into training and test sets (75% train, 25% test)
set.seed(123)
split = sample.split(social$Purchased, SplitRatio = 0.75)  
training_set = subset(social, split == TRUE)
#View(training_set)
test_set = subset(social, split == FALSE)

library(e1071)
classifier = svm(formula = Purchased ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')
y_pred = predict(classifier, newdata = test_set[-5])
cm = table(test_set[,4], y_pred)
cm

y_pred = predict(classifier, newdata = training_set[-5])
cmTrain = table(training_set[,4], y_pred)
cmTrain

accuracy = (sum(diag(cm))/sum(cm))*100
accuracy

accuracyT = (sum(diag(cmTrain))/sum(cmTrain))*100
accuracyT

