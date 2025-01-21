a<-c("North","East","West","South","East","North")
b<-factor(a)
b
b[-2]
b[-1]
b[1]
b[2]
b[c(2:4)]
levels(b)<-c(levels(b),"hello")
b
a1<-c("ZEENAT","ZOYA","ZHARI","ARSHAQ")
b1<-factor(a1)
b1
x<-gl(3,2,labels=c("R","DMBS","PYTHON"))
x


p<-c("akash","sinan","shinad","rizwin","aban","Arshaq","jabin","najadu","faseela","afrin","ziya","jeza")
p1<-factor(p)
p1
p1[8]
p1[c(6,9)]
p1[1:4]
p1[-7]
p1[-1:-5]

