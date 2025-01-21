# Sample data as shown in your example
x<-read.csv(file.choose())
x
# View and structure of the data
View(x)
str(x)

# Function for Min-Max Normalization (scales to [0,1])
nor <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

# Applying Min-Max Normalization to gre and gpa columns
x$gre_normalized <- nor(x$gre)
x$gpa_normalized <- nor(x$gpa)

# Display normalized data
print("Min-Max Normalized Data:")
print(x)

# For Z-score normalization (mean = 0, sd = 1)
x$gre_standardized <- scale(x$gre)
x$gpa_standardized <- scale(x$gpa)

# Display standardized data
print("Z-score Standardized Data:")
print(x)



#########################CODE###################################################



install.packages("naivebayes")
install.packages("psych")

# Load necessary libraries
library(naivebayes)
library(ggplot2)
library(psych)
library(dplyr)

# Load the dataset
data <- read.csv(file.choose())
View(data)
str(data)

# Crosstab of admit and rank
xtabs(~admit + rank, data = data)

# Convert admit and rank to factors
data$rank <- as.factor(data$rank)
data$admit <- as.factor(data$admit)
str(data)

# Pair panels for visualizing relationships
pairs.panels(data[-1])

# Boxplot for GRE and GPA by admit
data %>% ggplot(aes(x = admit, y = gre, fill = admit)) + geom_boxplot() + ggtitle("Box Plot for GRE by Admit")
data %>% ggplot(aes(x = admit, y = gpa, fill = admit)) + geom_boxplot() + ggtitle("Box Plot for GPA by Admit")

# Density plot for GPA by admit
data %>% ggplot(aes(x = gpa, fill = admit)) + geom_density(alpha = 0.5, color = 'black') + ggtitle("Density Plot for GPA by Admit")

# Data partition
set.seed(2145)
div <- sample(2, nrow(data), replace = TRUE, prob = c(0.80, 0.20))
train <- data[div == 1, ]
test <- data[div == 2, ]
str(train)

# Build the Naive Bayes model
model <- naive_bayes(admit ~ ., data = train)

# Summary of GRE for admit = 1
train %>% filter(admit == "1") %>% summarise(mean(gre), sd(gre))

# Plot the model
plot(model)

# Prediction on training data
pred_train <- predict(model, train, type = 'prob')
head(cbind(pred_train, train), 200)

# Confusion matrix and accuracy for training data
p1 <- predict(model, train)
tab1 <- table(p1, train$admit)
sum(diag(tab1)) / sum(tab1)

# Confusion matrix and accuracy for test data
p2 <- predict(model, test)
tab2 <- table(p2, test$admit)
sum(diag(tab2)) / sum(tab2) * 100


