bc <- read.csv(file.choose())
View(bc)
str(bc)
summary(bc)

# Display the frequency of each diagnosis category
table(bc$diagnosis)

# Convert the 'diagnosis' column to a factor with descriptive labels
bc$diagnosis <- factor(bc$diagnosis, levels = c("B", "M"), labels = c("Benign", "Malignant"))

# Define a normalization function (note: fixed normalization function)
bc_nor <- function(x) {
  (x - min(x)) / (max(x) - min(x))  # Normalization formula (fixing the original function)
}

# Apply the normalization function to all columns except the 'diagnosis' column
bc_norm <- as.data.frame(lapply(bc[, -2], bc_nor))

# Display the summary of the normalized data
summary(bc_norm)

# Split the data into training and test sets
train <- bc_norm[1:469, ]  # First 469 rows for training
test <- bc_norm[470:569, ]  # Remaining rows for testing

# Extract the labels for training and test sets
train_label <- bc[1:469, 2]  # Labels for the training set
test_label <- bc[470:569, 2]  # Labels for the test set

# Load the class library and apply k-NN algorithm
library(class)
pr <- knn(train, test, cl = train_label, k = 21)

# Create the confusion matrix to compare predicted labels with actual labels
tab <- table(predicted = pr, actual = test_label)
tab

