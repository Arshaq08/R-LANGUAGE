a<-c(10L,20L,30L)
b<-c('HELLO',"WORLD")
c<-c(TRUE,FALSE)
d<-c(6+1i,8+3i)
e<-list(a,b,c,d)

list1<-list("RAHUL","SAKSHI",c(1,2,3,4,5),TRUE,FALSE,10L,15L,10.5)
list1

list<-list(c("rahul","pooja"),c(6,3),list("MBA","BA"))
list:
names(list)<-c("student name","marks","courses"):
  
list<-list(c(10,20,3),c("MBA","BA","B>TECH"))
names(list)<-c("numbers","courses")
  print(list[1])
  print(list["courses"])
  print(list["numbers"])
  
  
x<-list(1:10)
class(x)
y<-list(10:20)
class(y)
a<-unlist(x)
print(x)
b<-unlist(y)
class(a)
class(b)

a<-list(c("sakshi","shila"),c(10,10),c("maths","ca"))
names(a)<-c("name","marks","subjects")
a[["Address"]]<-("delhi","kashmir")



a<-list(c("ABD","abha"),c(10,20,30),c(TRUE,FALSE))
names(a)<-c("char","number","logical")
print(a)
print(a[2])
print(a[3])
print(a[1])

print(a[[2]][3])

