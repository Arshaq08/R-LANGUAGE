y<-read.csv("C://Users//91904//Downloads//diabetes.csv")
y
head(y)
tail(y)
k<-y[ ,1]
k
k1<-y[, c(1,2,3)]
k1
k2<-y[ , 3]
k2
k3<-y[ ,c(5,6,7)]
k3
k4<-y[1,3]
k4
k5<-y[20,7]
k5

k6<-y[ ,c(3,8)]
tail(k6,n=10)
head(k6,n=10)

k7<-y[y$Glucose<125,]
k7
k8 <- y[y$Age > 25 & y$Age < 50, ]
k8

max(y$Pregnancies)
min(y$Pregnancies)
median(y$Pregnancies)
mean(y$Pregnancies)

max(y$Glucose)
min(y$Glucose)
median(y$Glucose)
mean(y$Glucose)

max(y$BloodPressure)
min(y$BloodPressure)
median(y$BloodPressure)
mean(y$BloodPressure)

max(y$SkinThickness)
min(y$SkinThickness)
median(y$SkinThickness)
mean(y$SkinThickness)

max(y$Insulin)
min(y$Insulin)
median(y$Insulin)
mean(y$Insulin)

max(y$BMI)
min(y$BM)
median(y$BM)
mean(y$BM)

max(y$DiabetesPedigreeFunction)
min(y$DiabetesPedigreeFunction)
median(y$DiabetesPedigreeFunction)
mean(y$DiabetesPedigreeFunction)

max(y$Age)
min(y$Age)
median(y$Age)
mean(y$Age)

max(y$Outcome)
min(y$Outcome)
median(y$Outcome)
mean(y$Outcome)