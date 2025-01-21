a<-list(c("ARkit","manir","mahima","amit"),
        list("MBA","MCA","BBA","BTECH"),
        c(10,8,15,15,7),
        list("DELHI","MUmabi","JAMMU","KASHMir"))
r<-a[[3]][-2]


y<-seq(1,200,length.out=5)
y
b<-seq(0,200,length.out=5)
b

v<-c(1,2,3,4)
v
v2<-c(5,6,7,8,9,10)
k<-array(c(v,2),dim=c(3,3,2))
k
r<-apply(k,c(1),sum)
r
r1<-apply(k,c(2),sum)
r1

j<-c("TRUE","FALSE","TRUE","TRUE","FALSE","FALSE")
j
h<-factor(j)
h
b<-c("EAST","NORTH","NORTH","SOUTH","EAST","WESt")
m<-factor(b)
m


b1<-c("EAST","NORTH","NORTH","SOUTH","EAST","WEST")
b1
c1<-factor(b1)
c1
k<-which(b1=="NORTH")[1]
b1[k]<-"WEST"
b1
