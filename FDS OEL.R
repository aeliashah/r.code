
# Install and load necessary libraries
install.packages("e1071")    # Install the e1071 package (only needed once)
install.packages("caTools")  # Install the caTools package (only needed once)
library(e1071)               # Load the e1071 library for Naive Bayes
library(caTools)             # Load caTools for data splitting
# Load the iris dataset
data(iris)
# Step 1: Inspect the dataset
print("First few rows of the dataset:")
head(iris)                   # Display the first few rows



print("Structure of the dataset:")
str(iris)                    # Check the structure of the dataset
print("Summary statistics:")

summary(iris)                # Summary statistics of the dataset
print("Distribution of target variable (Species):")
table(iris$Species)          # Check the class distribution of Species
# Step 2: Split the dataset into training and testing sets
set.seed(123)                # Set seed for reproducibility
split <- sample.split(iris$Species, SplitRatio = 0.8) # 80% training, 20% testing
train_data <- subset(iris, split == TRUE)            # Training set
test_data <- subset(iris, split == FALSE)           # Testing set
# Step 3: Train a Naive Bayes model
naive_bayes_model <- naiveBayes(Species ~ ., data = train_data) # Train the model
print("Trained Naive Bayes model:")
print(naive_bayes_model)     # Print the trained model details
# Step 4: Make predictions
predictions <- predict(naive_bayes_model, test_data) # Predict on the test set
print("Predictions on the test set:")
print(predictions)           # Print predictions
# Step 5: Evaluate model performance
confusion_matrix <- table(test_data$Species, predictions) # Generate confusion matrix
print("Confusion Matrix:")
print(confusion_matrix)      # Print confusion matrix
# Calculate accuracy
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix) # Accuracy calculation
cat("Model Accuracy:", round(accuracy * 100, 2), "%\n")         # Print accuracy

