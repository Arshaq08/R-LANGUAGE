

# Install and load dplyr package (if not already installed)
install.packages("dplyr")
library(dplyr)

# Create the data frame 'd'
d <- data.frame(
  name = c("Sai", "Teja", "Bheem"),
  roll_no = c(10, 6, 4),
  marks = c(6, 5, 8),
  address = c("Telangana", "Hyderabad", "Dholakpur"),
  age = c(20, 20, 35)
)

# Create the data frame 'd1'
d1 <- data.frame(
  name = c("Sai Teja", "Doremon", "Bheem", "Nobita", "Microsoft"),
  marks = c(99, 98, 97, 96, 99),
  attendance = c(89, 79, 88, 90, 87),
  a1 = c(1, 2, 3, 4, 5),
  a2 = c(12, 13, 14, 15, 16),
  a3 = c(11, 13, 15, 17, 19),
  a4 = c(9, 8, 7, 65, 6),
  a5 = c(7, 4, 8, 3, 57),
  a6 = c(8, 88, 66, 77, 55),
  a7 = c(99, 77, 55, 44, 33)
)

# Use dplyr functions with explanations
cat("**Select Specific Columns:**\n")

# Select roll_no and marks from d
s <- select(d, roll_no, marks)
s
s1 <- select(d, 2, 5)
s1
# Select the 'age' column
s2 <- select(d, age)
s2
# Select columns ending with "d"
s3 <- select(d, ends_with("d"))
s3

# Select columns containing "a"
s4 <- select(d, contains("a"))
s4
cat("\n**Create a new data frame using select:**\n")
# Select columns 2, 4, 6, 8, and 10 from d1
ss <- select(d1, 2, 4, 6, 8, 10)
ss
cat("\n**Filter Data:**\n")
# Filter rows where age is greater than 21 in d
f <- filter(d, age > 21)
f

# Filter rows with age greater than 20 and marks less than 10 in d
f1 <- filter(d, age > 20, marks < 10)
f1

cat("\n**Arrange Data:**\n")

# Arrange d in ascending order of age
a <- arrange(d, age)
a

# Arrange d in descending order of age
a1 <- arrange(d, desc(age))
a1

# Arrange d in ascending order of marks
a2 <- arrange(d, marks)
a2

# Arrange d in descending order of marks
a3 <- arrange(d, desc(marks))
a3

# Load the iris dataset
i <- iris

# Get dimensions of iris data
cat("\n**Working with the iris dataset:**\n")
i

# Select Sepal.Width and Petal.Length columns from iris
e <- select(i, 2, 4)
e

# Filter rows with Sepal.Width greater than 3.5 in iris
e1 <- filter(i, Sepal.Width > 3.5)
e1

# Select the Petal.Length column from iris
e2 <- select(i, 4)
e2


# Add a new column 'grade' based on marks (assuming thresholds)
d <- mutate(d, grade = case_when(
  marks >= 90 ~ "A",
  marks >= 80 ~ "B",
  marks >= 70 ~ "C",
  TRUE ~ "D"
))

