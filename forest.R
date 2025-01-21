data<-read.csv(file.choose(),sep=";",header=T)
head(data)
summary(data)
data$quality=as.factor(data$quality)
data_size=floor(nrow(data)*0.80)
index<-sample(1:nrow(data),size=data_size)
training<-data[index,]
testing<-data[-index,]
install.packages("randomForest")
library(randomForest)
?randomForest
rf<-randomForest(qualtiy~.,data=training,mtry=4,ntree=200,importance=TRUE)
rf
plot(rf)



# Read the dataset using file.choose() to manually select the file
data <- read.csv(file.choose(), sep = ";", header = TRUE)

# View the first few rows of the data
head(data)

# Get summary statistics of the dataset
summary(data)

# Convert 'quality' column to a factor (as it is a categorical variable)
data$quality = as.factor(data$quality)

# Split the data into training and testing sets (80% training, 20% testing)
data_size = floor(nrow(data) * 0.80)  # 80% of the data for training
index = sample(1:nrow(data), size = data_size)  # Randomly sample indices for training data

# Create the training and testing datasets
training = data[index, ]
testing = data[-index, ]

# Load the randomForest library
install.packages("randomForest")
library(randomForest)

# Check the documentation for randomForest (optional)
# ?randomForest

# Build the random forest model with the training data
rf = randomForest(quality ~ ., data = training, mtry = 4, ntree = 200, importance = TRUE)

# Print the random forest model summary
print(rf)

# Plot the random forest error rate (error vs. number of trees)
plot(rf)

