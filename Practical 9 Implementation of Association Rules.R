# Install and load necessary packages
install.packages("arules")
install.packages("arulesViz")
library(datasets)
library(arules)
library(arulesViz)

# Load and explore the Groceries dataset
data(Groceries)
class(Groceries)
Groceries@itemInfo[1:20, ]
View(Groceries)

# Display labels in a subset of transactions
apply(Groceries@data[, 10:20], 2, function(r) 
  paste(Groceries@itemInfo[r, "labels"], collapse = ", ")
)

# Generate frequent itemsets with varying lengths
itemsets <- apriori(Groceries, parameter = list(
  minlen = 1, maxlen = 1, support = 0.02, target = "frequent itemsets"
))
summary(itemsets)
inspect(head(sort(itemsets, by = "support"), 10))

itemsets <- apriori(Groceries, parameter = list(
  minlen = 2, maxlen = 2, support = 0.02, target = "frequent itemsets"
))
summary(itemsets)
inspect(head(sort(itemsets, by = "support"), 10))

itemsets <- apriori(Groceries, parameter = list(
  minlen = 3, maxlen = 3, support = 0.02, target = "frequent itemsets"
))
summary(itemsets)
inspect(head(sort(itemsets, by = "support"), 10))

itemsets <- apriori(Groceries, parameter = list(
  minlen = 4, maxlen = 4, support = 0.02, target = "frequent itemsets"
))
summary(itemsets)
inspect(head(sort(itemsets, by = "support"), 10))

# Plot item frequencies
itemFrequencyPlot(Groceries, topN = 20, type = "absolute")

# Generate association rules
rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8))
summary(rules)
options(digits = 2)
inspect(rules[1:10])

# Sort rules by confidence and inspect
rules <- sort(rules, by = "confidence", decreasing = TRUE)
inspect(rules[1:10])

# Analyze rules with high lift
inspect(head(sort(rules, by = "lift"), 10))

# Visualize rules
plot(rules)

# Visualize rules with high confidence (>0.9)
confidentRules <- rules[quality(rules)$confidence > 0.9]
plot(confidentRules, method = "matrix", measure = c("lift", "confidence"), control = list(reorder = "none"))

# Visualize rules with the highest lift
highLiftRules <- head(sort(rules, by = "lift"), 5)
plot(highLiftRules, method = "graph", control = list(type = "items"))

