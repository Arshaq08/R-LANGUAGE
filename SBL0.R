x<-c(6,12,8,9)
y<-c(10,7,8,6)

result<-plot(x,y,type="l",col="blue",lwol=3)
result1<-plot(x,y,main="RESULT 1",type="S",col="red",lwd=3)
result2<-plot(x,y,main="RESULT 2",type="b",col="red",lwd=2,lty=2)
result2<-plot(x,y,main="RESULT 3",type="o",col="red",lwd=2)
result2<-plot(x,y,main="RESULT 4",type="l",col="red",lwd=2)
result<-plot(x,y,type="l",col="BLUE",lwd=3,lty=1,pch=LETTERS[1:4])

A<-c(10,20,30,40)
labels<-c("A","B","C","D")
pie(A,labels,main="PIE CHARTTTTT",col=c("blue","yellow","black","red"))
legend()
#3d piechart
install.packages("plotrix")
library("plotrix")

x<-c(12,13, 14)
pie3D(x, labels = c("A", "B", "C"), col=c("yellow", "brown", "blue"))


