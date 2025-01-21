## array
a<-c(1,2,3,4)
a
b<-c(5,6,7,8,9)
b
d<-array(c(a,b),dim=c(2,2,2))
d
row_names<-c("r1","r2")
col_names<-c("r3","r4")
mrt_names<-c("r5","r6")
d<-array(c(a,b),dim=c(2,2,2),dimnames=list(row_names,col_names,mrt_names))
d
d[ ,2,1]
d[1,1,1]
d[ ,1,1]
d[c(1,2), ,1]
d[ ,c(1,2),2]

res<-apply(d,c(2),sum)
res
res<-apply(d,c(1),sum)
res

# create and arrya of 4 4 5
# assign name to the element of an array
#  Access al rows of matrix 1 
# Access 2nd and 3rd column of 2nd ,matric 
# Accesss 2nd column and 3rd row of 4th matrix
# access 3rd column 3rd row of 3rd matrix
# access element in the 3rd row and 4th column 1st matrix
# use apply function ND perform sum
# use apply function and perform sum on column
# create two arrays and perform all arthimetic operation




x <- array(1:80, dim = c(4, 4, 5))
dimnames(x) <- list(
  c("r1", "r2", "r3", "r4"),
  c("c1", "c2", "c3", "c4"),
  c("mat1", "mat2", "mat3", "mat4", "mat5")
)
x

mat1_rows <- x[, , 1]
mat2_cols <- x[ ,c(2,3,2), ]
mat4_element <- x[3,2,4]
mat3_element <- x[3,3,3]
mat1_element <- x[3,4,1]


total_sum <- apply(x, MARGIN = c(1, 2, 3), FUN = sum)
column_sums <- apply(x, MARGIN = c(2, 3), FUN = sum)
array1 <- array(1:16, dim = c(4, 4))
array2 <- array(17:32, dim = c(4, 4))

addition_result <- array1 + array2
subtraction_result <- array1 - array2
multiplication_result <- array1 * array2
division_result <- array1 / array2

print(mat1_rows)
print(mat2_cols)
print(mat4_element)
print(mat3_element)
print(mat1_element)
print(total_sum)
print(column_sums)
print(addition_result)
print(subtraction_result)
print(multiplication_result)
print(division_result)

