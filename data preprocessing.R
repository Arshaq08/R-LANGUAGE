#define the data structure and store it into some r file and in to correct working directory

df=data.frame(name=c("ABAN","ROY","RAHUL"),age=c(12,13,15),course=c("CSE","CIVIL","MECH"))
write.csv(df,file = "CLASS.csv")
ls()
rm(list = ls())
v=c(1,3,4)
save(v,file = "M.RData")
getwd()
#creatdire#create a data fr4ame consiting of records of 3 students and in to some csv file and the file should not store in correct working directory
#display the list of all variable and remove all the variable in one
car=read.csv("usedcars.csv")
car
str(car)
ncol(car)
nrow(car)
summary(car$year)
ls()
range(car$price)
quantile(car$year)
a=table(car$year)
a
table(car$color)
prop.table(a)
#########################################################################################
############################################################################
############################################################################################
##find the number of colmn and row of the fileand geneate the summary
##find the diffreence bw max and min values of prices genetra THE FREQUENCY TABLE FOR ACCURte color 
##and cl;aculate the proportion of the car data
car=read.csv("usedcars.csv")
car
str(car)
nrow(car)
ncol(car)
summary(car$year)
summary(car$model)
range(car$price)
diff(range(car$price))
table(car$color)
prop.table(table(car$color))
