install.packages("ggplot2")
library(ggplot2)

ggplot(data=iris, aes(y=Petal.Length, x=Sepal.Length)) + 
  geom_point()

ggplot(data=iris, aes(y=Petal.Length, x=Sepal.Length, col=Species)) + 
  geom_point()

ggplot(data=iris, aes(y=Petal.Length, x=Sepal.Length, shape=Species)) + 
  geom_point()

ggplot(data=iris, aes(y=Petal.Length, x=Sepal.Length, col=Species, shape=Species)) + 
  geom_point()

ggplot(data = iris, aes(x = Sepal.Length)) + geom_histogram()
ggplot(data = iris, aes(x = Sepal.Length)) +geom_histogram(bins = 50)
ggplot(data = iris, aes(x = Sepal.Length)) + geom_histogram(bins = 50, fill = "brown")
ggplot(data = iris, aes(x = Sepal.Length)) + geom_histogram(bins = 50, fill = "brown", color = "black")
ggplot(data = iris, aes(x = Sepal.Length, fill = factor(Species))) + geom_histogram(bins = 50)

ggplot(data=iris,aes(y=Petal.Length,fill=Species))+geom_boxplot()


# View the airquality dataset
View(airquality)

# Replace the missing values with the mean value of each variable
airquality$Ozone[is.na(airquality$Ozone)] <- mean(airquality$Ozone, na.rm = TRUE)
airquality$Solar.R[is.na(airquality$Solar.R)] <- mean(airquality$Solar.R, na.rm = TRUE)
airquality$Temp[is.na(airquality$Temp)] <- mean(airquality$Temp, na.rm = TRUE)
summary(airquality)

# Replace missing values in the Ozone column with random values 
# uniformly distributed between the minimum and maximum of non-missing Ozone values
airquality$Ozone[is.na(airquality$Ozone)] <- runif(
  n = sum(is.na(airquality$Ozone)),
  min = min(airquality$Ozone, na.rm = TRUE),
  max = max(airquality$Ozone, na.rm = TRUE)
)

airquality$Solar.R[is.na(airquality$Solar.R)] <- runif(
  n = sum(is.na(airquality$Solar.R)),
  min = min(airquality$Solar.R, na.rm = TRUE),
  max = max(airquality$Solar.R, na.rm = TRUE)
)

airquality$Temp[is.na(airquality$Temp)] <- runif(
  n = sum(is.na(airquality$Temp)),
  min = min(airquality$Temp, na.rm = TRUE),
  max = max(airquality$Temp, na.rm = TRUE)
)
summary(airquality)

# Replace missing values in the Temp column with random samples from existing values
airquality$Temp[is.na(airquality$Temp)] <- sample(
  airquality$Temp[!is.na(airquality$Temp)],
  size = sum(is.na(airquality$Temp)),
  replace = TRUE
)

# Replace missing values in the Solar.R column with random samples from existing values
airquality$Solar.R[is.na(airquality$Solar.R)] <- sample(
  airquality$Solar.R[!is.na(airquality$Solar.R)],
  size = sum(is.na(airquality$Solar.R)),
  replace = TRUE
)

# Replace missing values in the Ozone.Priority column with random samples from existing levels
airquality$Ozone.Priority[is.na(airquality$Ozone.Priority)] <- sample(
  levels(airquality$Ozone.Priority),
  size = sum(is.na(airquality$Ozone.Priority)),
  replace = TRUE
)

summary(airquality)



