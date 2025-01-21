a<-1
while(a<20){
  print(a)
  if(a==15)
    break
  a=a+1
}
a<-10:20
for(val in a){
  if(val==18)
    next
  print (val)
}

for (i in 1:5) {
  if (i == 3) {
    break  
  }
  print(i)
}
for (i in 1:15) {
  if (i %% 2 == 0) {
    print(i)  
  } else {
    next  
  }
}

numbers <- 1:100
for (i in numbers) {
  if (i == 45) {
    break
  }
  print(i)
}
k <- 1:50
for (i in k) {
  if (i %% 2 == 0) {
    print(i)
  } else {
    next
  }
}
v<-c("HELLO ","LOOP")
cnt<-2
repeat{
  print(v)
  cnt<-cnt+1
  if(cnt>11){
    break
  }
}
# 5 different expamle for repeat

i <- 5
repeat {
  print(i)
  i <- i - 1
  if (i == 0) {
    break  
  }
}
sum <- 0
repeat {
  number <- as.numeric(readline("Enter a positive number (or 0 to stop): "))
  if (number > 0) {
    sum <- sum + number
  } else {
    break  
  }
}
cat("The sum is:", sum, "\n")


vowels <- c("a", "e", "i", "o", "u")
repeat {
  character <- sample(letters, 1)
  if (character %in% vowels) {
    cat("The first vowel is:", character, "\n")
    break  
  }
}


