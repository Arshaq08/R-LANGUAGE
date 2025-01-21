a=c(1,2,3,4)
class(a)
print(a)
b=c(5,6,7,8)
class(b)
print(b)

a1=c('a','b','c')
print(a1[1])
a2=c(10,20,30)
print(a2[2])

a3=10:40
a3
 
a4=seq(10,100,10)
a4
print(a4[2])
print(a4[6])
a5=c(1,2,3,4,5,6,7,8,9)
print(a5[-1])
print(a5[-3])
a7=seq(10,50,5)
a7

x=c(1,2,3,8,9,5,4,6)
print(sort(x))
print(sort(x,decreasing=TRUE))
x[x>7|x<6]
max(x)
min(x)

data=c(3,4,5,6,7,8,9,8,5,4)
data
which(data==6)
data[data>7]
data>6
data[y<8&y>4]
data[y<8|y>4]
