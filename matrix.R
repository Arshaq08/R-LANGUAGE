a<-matrix(c(1,2,3,4,5,6,7,8,9,10,11,12),nrow=3,ncol=4,byrow=TRUE)
a
b<-matrix(c(1,2,3,4,5,6,7,8,9,10,11,12),nrow=3,ncol=4,byrow=FALSE)
b
dimnames(a)<-list(c("R1","R2","R3"),c("C1","C2","C3","C4"))
a
dimnames(b)<-list(c("ROW1","ROW2","ROW3"),c("COL1","COL2","COL3","COL4"))
b
a[1,1]
a[1, ]
a[ ,1]
a[1:2, ]
a[ ,1:2]
a[2,3]
a[2,3]<-20
a
a[a<10]<- -1
a
a[a>10]<-0
a
rbind(a,c(13,14,15,16))
cbind(a,c(17,18,19))



# Create a matrix of 30 elelments
# name all rows and column
# Access 3rd rows
# access 5th, 6th column 
# access 8th column
# asccess 1,2,3,4,5 column
# access the 3rd row
# access the rd row
# access the 3rd row
# access the  1st column
# access the  2nd column
# access the  3rd column
# access the  4th column
# access element in the 3rd column and 3rd rows
# accesss element in the 2nd row and 5th column
# modify elemenmts by o greater than 10
# modify emements by -2 greaterthan 5
# add two more rows 
# add three more column trnaspose the matrix
# delete 3rd row
# delete 1st column
# create two matrrix and perform all arthimatic operation


x<-matrix(1:30,nrow=6,ncol=5,byrow = TRUE)
x
dimnames(x)<-list(c("R1","R2","R3","R4","R5","R6"),c("C1","C2","C3","C4","C5"))
x
x[3, ]
x[5, ]
x[6, ]
x[ ,1]
x[ ,2]
x[ ,3]
x[ ,4]
x[3,3]
x[2,5]
x[x>10]<-0
x
x[x>10]<- -2
x
rbind(x,c(31,32,33,34,35))
rbind(x,c(36,37,38,39,40))
cbind(x,c(41,42,43,44,45,46))
x[-3, ]
x[ ,-1]

