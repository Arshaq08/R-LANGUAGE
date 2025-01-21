# Installing Packages
install.packages("ClusterR")
install.packages("cluster")

# Loading Packages
library(ClusterR)
library(cluster)
View(iris)

# Removing initial label of Species from original dataset
iris_1 <- iris[, -5]

# Fitting K-Means Clustering Model to the dataset
set.seed(240) # Setting seed
kmeans.re <- kmeans(iris_1, centers = 3, nstart = 20)

# Displaying K-Means Results
kmeans.re
summary(kmeans.re)

# Cluster Identification for Each Observation
kmeans.re$cluster

# Confusion Matrix
cm <- table(iris$Species, kmeans.re$cluster)
cm

# Model Evaluation and Visualization
plot(iris_1[c("Sepal.Length", "Sepal.Width")],
     col = kmeans.re$cluster,
     main = "K-means with 3 clusters")

# Plotting Cluster Centers
points(kmeans.re$centers[, c("Sepal.Length", "Sepal.Width")],
       col = 1:3, pch = 8, cex = 3)

#heiraschical


install.packages("stats")
library(stats)
iris1 <- iris
iris1$Species <- NULL
d <- dist(iris1, method = "euclidean")
hfit <- hclust(d, method = "average")
plot(hfit)
grps <- cutree(hfit, k = 4)
grps
rect.hclust(hfit, k = 4, border = "red")

