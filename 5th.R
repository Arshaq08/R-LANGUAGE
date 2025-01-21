
#iris data set with normalization
data("iris")
head(iris)
summary(iris)
#NAs
colSums(is.na(iris))
df=iris %>% select(1:4) %>% scale() %>% data.frame()
head(df)
?kmeans
result=kmeans(df,3,nstart = 25)
print(result)
aggregate(df,by=list(cluster=result$cluster),mean)
newdata=cbind(df,cluster=result$cluster)
head(newdata)
result$cluster
head(result$cluster,4)
result$size
result$centers

library("ggplot2")
library(factoextra)
ggplot(data=newdata, aes(x=result$cluster))+geom_bar(fill="steelblue")
fviz_cluster(result,data=newdata)
fviz_nbclust(iris[,3:4],kmeans,method="wss")+geom_vline(xintercept=3,linetype=5)+labs(subtitle="Elbow method")