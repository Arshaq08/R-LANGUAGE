num <- as.integer(readline(prompt="Enter a number: "))
if (num %% 2 == 0) {
  print("The number is even")
} else {
  print("The number is odd")
}

num1 <- as.numeric(readline(prompt="Enter first number: "))
num2 <- as.numeric(readline(prompt="Enter second number: "))
if (num1 < num2) {
  print("First number is less than second number")
} else if (num1 > num2) {
  print("First number is greater than second number")
} else {
  print("Both numbers are equal")
}


vector <- c(1, 2, 3, 4, 5)
num <- as.numeric(readline(prompt="Enter a number to search: "))
if (num %in% vector) {
  cat(num,"is present in the vector");
} else {
  cat(num," is not present in the vector");
}

num <- as.numeric(readline(prompt="Enter a number: "))
if (num > 0) {
  print("Number is positive")
} else if (num < 0) {
  print("Number is negative")
} else {
  print("Number is zero")
}
















age <- as.integer(readline(prompt="Enter your age: "))
if (age >= 18) {
  print("You are eligible to vote")
} else {
  print("You are not eligible to vote")
}

num <- as.integer(readline(prompt="Enter a number: "))
if (num == 2) {
  print("The number is prime")
} else if (num < 2 || any(num %% 2:(num-1) == 0)) {
  print("The number is not prime")
} else {
  print("The number is prime")
}

age <- as.integer(readline(prompt="Enter your age: "))
if (age >= 13 && age <= 19) {
  print("You are a teenager")
} else {
  print("You are not a teenager")
}

marks <- as.numeric(readline(prompt="Enter your marks: "))
if (marks >= 90) {
  print("Grade: A")
} else if (marks >= 80) {
  print("Grade: B")
} else if (marks >= 70) {
  print("Grade: C")
} else if (marks >= 60) {
  print("Grade: D")
} else {
  print("Grade: F")
}

year <- as.integer(readline(prompt="Enter a year: "))
if (year %% 4 == 0 && (year %% 100 != 0 || year %% 400 == 0)) {
  print("Leap year")
} else {
  print("Not a leap year")
}

month <- as.integer(readline(prompt="Enter the month (1-12): "))
if (month %in% c(3, 4, 5)) {
  print("Spring")
} else if (month %in% c(6, 7, 8)) {
  print("Summer")
} else if (month %in% c(9, 10, 11)) {
  print("Autumn")
} else if (month %in% c(12, 1, 2)) {
  print("Winter")
} else {
  print("Invalid month")
}
