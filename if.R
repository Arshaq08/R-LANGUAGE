a <- readline(prompt = "Enter the number: ");
a <- as.integer(a);
a
if (a > 20) {
  print("a is greater than 20");
}else{
  print("a is less than 20");
}

b <- 24
if (b %% 5 == 0) {
  print("It is a multiple of 5");
} else {
  print("It is not a multiple of 5");
}


number <- 8

if (number %% 2 == 0) {
  print(paste(number, "is even"));
} else {
  print(paste(number, "is odd"));
}

k<- 0
if(k<0){
  print("negative");
}else if(k>0){
  print("positive");
}else{
  print ("zero");
}
