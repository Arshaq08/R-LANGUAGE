library(dplyr)

data(iris)
view(iris)



ta <- iris %>%
  filter(Species == "setosa" & Petal.Length > 1.4 & Sepal.Length > 3.5) %>%
  mutate(sl = Sepal.Width) %>%
  select(Sepal.Length, Petal.Length, Species, sl)

ta
