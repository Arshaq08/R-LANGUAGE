library("neuralnet")

# Generate 50 random numbers uniformly distributed between 0 and 100
traininginput <- as.data.frame(runif(50, min = 0, max = 100))
trainingoutput <- sqrt(traininginput)

# Column bind the data into one variable
trainingdata <- cbind(traininginput, trainingoutput)
colnames(trainingdata) <- c("Input", "Output")

# Train the neural network
net.sqrt <- neuralnet(Output ~ Input,
                      trainingdata, 
                      hidden = 10, threshold = 0.01)
print(net.sqrt)

# Plot the neural network
plot(net.sqrt)

# Test the neural network on some training data
testdata <- as.data.frame((1:10)^2)  # Generate some squared numbers
net.results <- compute(net.sqrt, testdata)  # Run them through the neural network

# Check the results
print(net.results$net.result)

# Display a better version of the results
cleanoutput <- cbind(testdata, sqrt(testdata), as.data.frame(net.results$net.result))
colnames(cleanoutput) <- c("Input", "Expectedo/p", "NeuralNetO/p")
print(cleanoutput)






##create an ann model for log of randum 20 numbers


# Load the neuralnet package
install.packages("neuralnet")
library(neuralnet)

# Step 1: Generate 20 random numbers
set.seed(123)  # For reproducibility
random_numbers <- runif(20, min = 1, max = 100)  # Uniform random numbers between 1 and 100

# Step 2: Compute the logarithm of the numbers
log_values <- log(random_numbers)

# Step 3: Prepare the data
data <- data.frame(
  input = random_numbers, 
  output = log_values
)

# Step 4: Create and train an ANN model
# Use a simple neural network with 1 hidden layer and 5 neurons
model <- neuralnet(output ~ input, data = data, hidden = 5, linear.output = TRUE)

# Step 5: Plot the neural network
plot(model)

# Step 6: Make predictions using the trained model
predictions <- predict(model, newdata = data)

# Show the original values, predictions, and actual logarithms
result <- data.frame(
  Input = random_numbers,
  Actual_Log = log_values,
  Predicted_Log = predictions
)

# Print the result
print(result)
