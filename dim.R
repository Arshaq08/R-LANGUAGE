a<-list(c("ARkit","manir","mahima","amit"),
        list("MBA","MCA","BBA","BTECH"),
        c(10,8,15,15,7))
a
res<-c(a[[1]],a[[2]])
res
b<-data.frame(emp.id=c(1,2,3,4,5),
             emp.name=c("SAHIL","ARSHAQ","AMIT","SHINAD","AKASH"),
             emp.salary=c(10000,980000,11000,150000,25000),
             emp.address=c("DELHI","MUMBAI","JAMMU","KERALA","KASHMIR"))
b
subset(b,emp.salary>100000,select=c(emp.name,emp.address))

a1<-c(1,2,3,4,5,6)
a2<-c(7,8,8,6,5,88)
result<-array(c(a1,a2),dim=c(3,3,2))
result
