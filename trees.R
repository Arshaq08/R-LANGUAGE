trees
dim(trees)
str(trees)
tail(trees)
mean(trees$Girth)
median(trees$Girth)
max(trees$Girth)
min(trees$Girth)

mean(trees$Height)
median(trees$Height)
max(trees$Height)
min(trees$Height)


mean(trees$Volume)
median(trees$Volume)
max(trees$Volume)
min(trees$Volume)

head(trees)
head(trees,n=10)


tall <- trees[trees$Height > 70, ]
print(tall$Height)
short <- trees[trees$Height <= 70, ]
print(short$Volume)
c<-trees[ ,c(1,3)]
c




