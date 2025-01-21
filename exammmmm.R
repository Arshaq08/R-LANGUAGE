
country <- c("FRANCE", "SPAIN", "GERMANY", "SPAIN", "GERMANY", "FRANCE", "SPAIN", "FRANCE", "GERMANY", "FRANCE")
age <- c(44, 27, 30, 38, 40, 35, NA, 48, 50, 37)
salary <- c(72000, 48000, 54000, 61000, NA, 58000, 52000, 79000, 83000, 67000)
purch <- c("No", "Yes", "No", "No", "Yes", "Yes", "NO", "Yes", "No", "Yes")
my_data <- data.frame(country, age, salary, purch)
View(my_data)


install.packages("sqldf")
library(sqldf)
result <- sqldf("SELECT country FROM my_data ORDER BY salary DESC LIMIT 1")
print(result)
