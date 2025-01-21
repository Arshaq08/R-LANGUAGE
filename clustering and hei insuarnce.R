# Load dataset
df <- read.csv()

# Encode categorical variables
df$sex <- as.numeric(factor(df$sex))
df$smoker <- as.numeric(factor(df$smoker))
df$region <- as.numeric(factor(df$region))

# Standardize the data
scaled_df <- scale(df)

# Apply K-Means Clustering
set.seed(123)  # For reproducibility
kmeans_result <- kmeans(scaled_df, centers = 3)  # Set number of clusters
df$cluster_kmeans <- kmeans_result$cluster

# Apply Hierarchical Clustering
distance_matrix <- dist(scaled_df)  # Compute distance matrix
hc_result <- hclust(distance_matrix, method = "ward.D")
df$cluster_hc <- cutree(hc_result, k = 3)  # Cut into 3 clusters

# Load ggplot2 for visualization
library(ggplot2)

# Visualize K-Means clusters
ggplot(df, aes(x = age, y = charges, color = as.factor(cluster_kmeans))) +
  geom_point() +
  ggtitle("K-Means Clustering Results") +
  labs(color = "Cluster")

# Visualize Hierarchical clusters
ggplot(df, aes(x = age, y = charges, color = as.factor(cluster_hc))) +
  geom_point() +
  ggtitle("Hierarchical Clustering Results") +
  labs(color = "Cluster")
