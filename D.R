install.packages("dplyr")
library(dplyr)

# Create a data frame
d <- data.frame(
  name = c("Alice", "Bob", "Charlie", "Diana", "Emma", "Frank", "Grace", "Henry", "Isabel", "Jack"),
  age = c(25, 30, 22, 18, 28, 40, 19, 35, 21, 27),
  marks = c(85, 78, 92, 65, 80, 72, 95, 88, 70, 82),
  address = c("New York", "Los Angeles", "Chicago", "London", "Paris", "Berlin", "Tokyo", "Beijing", "Rome", "Madrid")
)
d

# Calculations on the age column
s <- summarise(d, mean_age = mean(age))  # Mean age
s1 <- summarise(d, min_age = min(age))  # Minimum age (corrected)
s2 <- summarise(d, max_age = max(age))  # Maximum age
s3 <- summarise(d, median_age = median(age))  # Median age

# Print the results
s
s1
s2
s3

four <- d[, 4] 
four
fourth <- d[, -4]
fourth
ns <- d[, c(1, 3, 4)]  
ns

s5 <- d[, starts_with("s")]  
s6 <- d[, ends_with("h")]  
s7 <- d[, grepl("l", names(d))]  
s8 <- d[, 3:5]  
s5
s6
s7
s8
#extract 4th column
#extract all columns except 4th column
#extract 1st, 3rd and 4th columns
#extract all the columns starts with "s"
#extract all the columns ends with "s"
#extract all the columns ends with "h"
#extract all the columns contains "l"
#extract columns from 3 to 5
#extract all the rows where species= setosa
#find median of 1st column
#find maximum value of 2nd column
#find minimum value of 3rd column
#find mean of 4th column



