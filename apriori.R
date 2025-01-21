# Install and load necessary packages
install.packages("arules")
install.packages("arulesViz")
library(datasets)
library(arules)
library(arulesViz)

# Load the Groceries dataset
data(Groceries)

# Check the class of the dataset and view its structure
class(Groceries)  # Should return "transactions"
Groceries@itemInfo[1:20, ]  # View metadata of the items
View(Groceries)  # Open the dataset in a viewer

# Display item labels in a subset of transactions
labels <- apply(Groceries@data[, 10:20], 2, function(r) 
  paste(Groceries@itemInfo[r, "labels"], collapse = " , ")
)
print(labels)

# Frequent Itemsets
itemsets <- apriori(Groceries, parameter = list(
  support = 0.02,    # Minimum support threshold
  minlen = 1,        # Minimum length of itemsets
  maxlen = 1,        # Maximum length of itemsets
  target = "frequent itemsets" # Find frequent itemsets
))

# Summary and inspection
summary(itemsets)
inspect(head(SORT(itemsets, by = "support"), 10))  # Sort by support and inspect top 10

# Create association rules
rules <- apriori(Groceries, parameter = list(
  support = 0.02,    # Minimum support
  confidence = 0.8,  # Minimum confidence
  minlen = 2         # Minimum length of rules
))

# Inspect the rules
summary(rules)
inspect(head(SORT(rules, by = "lift"), 10))  # Sort by lift and inspect top 10 rules

# Visualize the rules
plot(rules, method = "graph", engine = "htmlwidget")
