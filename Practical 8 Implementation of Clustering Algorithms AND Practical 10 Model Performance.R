# ----------------------------------------
# Part 1: Hierarchical Clustering (Iris Dataset)
# ----------------------------------------

# Load dataset
iris1 <- iris
iris1$Species <- NULL  # Remove target column
View(iris1)

# Calculate distance matrix
d <- dist(iris1, method = "euclidean")

# Perform hierarchical clustering
hfit <- hclust(d, method = "average")

# Plot dendrogram
plot(hfit)

# Cut the dendrogram into 4 clusters and add rectangles
grps <- cutree(hfit, k = 4)
rect.hclust(hfit, k = 4, border = "red")

# ----------------------------------------
# Part 2: Random Forest (Classification Task)
# ----------------------------------------

# Load dataset
data <- read.csv(file.choose(), sep = ';', header = TRUE)

# Explore dataset
head(data)
str(data)
summary(data)

# Convert target variable to factor
data$quality <- as.factor(data$quality)

# Split dataset into training and testing
data_size <- floor(nrow(data) * 0.80)
index <- sample(1:nrow(data), size = data_size)
training <- data[index, ]
testing <- data[-index, ]

# Install and load Random Forest package
install.packages("randomForest")
library(randomForest)

# Train Random Forest model
rf <- randomForest(quality ~ ., data = training, mtry = 4, ntree = 200, importance = TRUE)

# Output Random Forest model details
rf

# Plot model performance
plot(rf)
