install.packages("ggplot2")
library(ggplot2)

# Creating the plot for all species with facets and a linear model
1.
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point()
2.
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  facet_wrap(~Species)
3.
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  facet_wrap(~Species) +
  geom_smooth(method = "lm")
4.
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  facet_wrap(~Species) +
  geom_smooth(method = "lm")+theme(axis.text = element_text(color = "blue",size = 14))

# Load the ggplot2 library
library(ggplot2)

# Create the ggplot
ggplot(filter(iris, Species == "setosa"), aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +  # Add points for each observation
  geom_smooth(method = "lm", color = "red") +  # Add a linear model fit line
  coord_cartesian(xlim = c(4, 8), ylim = c(2, 5)) +  # Set the limits for x and y axes
  theme(axis.text = element_text(color = "blue", size = 14))  # Customize axis text color and size


library(ggplot2)
library(dplyr)

# Filter the data 
ggplot(filter(iris, Species == "setosa"), aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  coord_cartesian(xlim = c(4, 8), ylim = c(2, 5))

install.packages("plotly")
# Load the required library
library(plotly)

# Prepare the data
dfc <- mtcars
dfc$name <- row.names(mtcars)

# Create a plotly plot
p <- plot_ly(data = dfc, x = ~cyl, y = ~disp,color=~factor(cyl))
p

#with attch(iris)
# Load the plotly library
library(plotly)
attach(iris)
# Create the histogram using plot_ly
hist <- plot_ly(data = iris, x = ~Sepal.Length, type = 'histogram')

# Define the layout with title and axis labels
hist <- layout(hist,
               title = "Iris Dataset",
               xaxis = list(title = "Sepal Length"),
               yaxis = list(title = "Count"))
hist
# Load the plotly library
library(plotly)

# Create the bar chart
fig <- plot_ly(
  x = c("Beverage", "Vegetables", "Dairy"),  # Correct spelling
  y = c(20, 14, 25),
  type = 'bar',
  marker = list(color = 'orange')  # Correct way to set bar color
)
fig

