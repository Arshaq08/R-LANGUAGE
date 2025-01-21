# Load the iris dataset
iris1 = iris

# Remove the 'Species' column (we will only work with numeric variables)
iris1$Species = NULL

# Compute the pairwise Euclidean distance matrix
d = dist(iris1, method = "euclidean")

# Perform hierarchical clustering using the average linkage method
hfit = hclust(d, method = "average")

# Plot the dendrogram
plot(hfit, main = "Hierarchical Clustering Dendrogram", xlab = "Index", ylab = "Height")

# Cut the dendrogram into 4 clusters
grps = cutree(hfit, k = 4)

# Print the cluster assignments
print(grps)

# Add red rectangles around the 4 clusters on the dendrogram
rect.hclust(hfit, k = 4, border = "red")

