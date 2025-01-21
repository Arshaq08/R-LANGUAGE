a<-c(8,6,7,11,13)
a
res<-barplot(a)
res
temp<-c(22,27,26,24,23,29,10)
result<-barplot(temp,main="Result",
                xlab="x-axis",
                ylab="y-axis",
                names.arg=c("SUN","MON","TUE","WED","THUR","FRI","SAT"),
                col="BLUE",
                density=10)
result
temp1<-c(41,29,11,20,13,23,29,21,10,33,35,45)
r2<-barplot(temp1,main="YEAR",
            xlab="MONTH",ylab="DAYS",
            names.args=c("JAN","FEB","MAR","APRIL","MAY","JUN","JUL","AUG","SEP","NOV","DEC"),
            col="GREEN",
            density=6,border="BLACK")
r2

data <- matrix(c(122, 203, 167, 118, 178, 673, 213), nrow = 2, ncol = 4)


o <- barplot(data,
             main = "OOOOOO", 
             xlab = "CLASS",   
             names.arg = c("1st", "2nd", "3rd", "4th"),  
             col = c("red", "blue"),
             beside = TRUE)        
o



x <- c(5,6,7,8,9,11,13,4)
y <- c(99,98,95,85,94,90,88,65)

plot(x, y, main = "REsult", xlab = "X", ylab = "Y", col = "red", cex = 2)
k<-c(4,5,6,7,8,9,1,2)
l<-c(88,66,56,89,77,55,44,66)
points(k,l,col="BLUE",cex=2)





x1<-c(5,7,8,7,2,2,9,4,11,12,9,6)
y1<-c(99,86,87,88,111,103,87,94,78,77,85,86)

plot(x1,y1,main="Result", xlab="x-label", ylab="y-label", col="red", cex=2)
x2<-c(2,2,8,15,8,12,9,7,3,11,4,7,14,12)
y2<-c(100,105,84,105,90,99,90,95,94,100,79,112,91,80)
points(x2,y2,col="blue",cex=2)

v<-c(13,22,28,7,31)
plot(v,type="o")  

v<-c(13,22,28,7,31)
plot(v,type="s",col="green",xlab = "Month", ylab = "Temperature")


v<-c(13,22,28,7,31)
w<-c(11,13,32,6,35)
x<-c(12,22,15,34,55)
plot(v,type="o", col="green", xlab = "Month", ylab = "Temperature")
lines(w,type="o",col="red")
lines(x,type="o",col="blue")

a<-c(12,15,18)
res<-pie(a)
res