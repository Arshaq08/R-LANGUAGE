n <- as.integer(readline("Enter the number of elements in the vector: "))
v <- character(n)
for (i in 1:n) {
  v[i] <- as.numeric(readline(paste("Enter element", i, ": ")))
}

s <- min(v)
l <- max(v)

cat("Smallest number:", s, "\n")
cat("Largest number:", l, "\n")

