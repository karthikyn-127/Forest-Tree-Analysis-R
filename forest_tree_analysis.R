
setwd("C:/Users/karthi/Desktop/Forest_Tree_R_Project")

getwd()
list.files()


tree_data <- read.csv("trees.csv")

# Display the first 6 rows
head(tree_data)

# Check the number of rows and columns
dim(tree_data)

# Check column names
names(tree_data)


tree_data <- tree_data[, c("Girth", "Height", "Volume")]

# Check the cleaned dataset
head(tree_data)
dim(tree_data)
str(tree_data)


write.csv(tree_data, "trees_cleaned.csv", row.names = FALSE)


# Forest Tree Data Analysis and Volume Prediction Using R

# Load the cleaned dataset
tree_data <- read.csv("trees_cleaned.csv")

# Display the dataset
print(head(tree_data))

# Dataset size
print(dim(tree_data))

# Structure of the dataset
str(tree_data)

# Summary statistics
summary(tree_data)


# Check missing values
colSums(is.na(tree_data))

# Check duplicate rows
sum(duplicated(tree_data))


# Calculate mean, median, minimum, maximum and standard deviation

statistics <- data.frame(
  Variable = names(tree_data),
  Mean = sapply(tree_data, mean),
  Median = sapply(tree_data, median),
  Minimum = sapply(tree_data, min),
  Maximum = sapply(tree_data, max),
  Standard_Deviation = sapply(tree_data, sd)
)

print(statistics)

# Save the results
write.csv(statistics, "descriptive_statistics.csv",
          row.names = FALSE)


# Graph 1: Distribution of tree girth
png("girth_distribution.png")
hist(tree_data$Girth,
     main = "Distribution of Tree Girth",
     xlab = "Girth (inches)",
     col = "lightgreen",
     border = "black")
dev.off()

# Graph 2: Girth versus volume
png("girth_vs_volume.png")
plot(tree_data$Girth, tree_data$Volume,
     main = "Tree Girth vs Volume",
     xlab = "Girth (inches)",
     ylab = "Volume (cubic feet)",
     pch = 19,
     col = "darkgreen")
dev.off()

# Graph 3: Height versus volume
png("height_vs_volume.png")
plot(tree_data$Height, tree_data$Volume,
     main = "Tree Height vs Volume",
     xlab = "Height (feet)",
     ylab = "Volume (cubic feet)",
     pch = 19,
     col = "blue")
dev.off()

# Correlation analysis
correlation <- cor(tree_data)

print(correlation)

# Save correlation results
write.csv(correlation, "correlation_matrix.csv")


# Split data into training and testing sets
set.seed(123)

train_rows <- sample(
  seq_len(nrow(tree_data)),
  size = floor(0.8 * nrow(tree_data))
)

train_data <- tree_data[train_rows, ]
test_data <- tree_data[-train_rows, ]

# Train a linear regression model
model <- lm(Volume ~ Girth + Height,
            data = train_data)

# Display model results
summary(model)

# Predict volume for test records
predictions <- predict(model, newdata = test_data)

# Compare actual and predicted volume
comparison <- data.frame(
  Actual_Volume = test_data$Volume,
  Predicted_Volume = round(predictions, 2)
)

print(comparison)

# Calculate RMSE and MAE
rmse <- sqrt(mean(
  (test_data$Volume - predictions)^2
))

mae <- mean(
  abs(test_data$Volume - predictions)
)

# Calculate test R-squared
r_squared <- 1 -
  sum((test_data$Volume - predictions)^2) /
  sum((test_data$Volume - mean(test_data$Volume))^2)

cat("RMSE:", round(rmse, 2), "\n")
cat("MAE:", round(mae, 2), "\n")
cat("Test R-squared:", round(r_squared, 3), "\n")

# Save predictions and evaluation results
write.csv(comparison, "predictions.csv",
          row.names = FALSE)

evaluation <- data.frame(
  RMSE = rmse,
  MAE = mae,
  Test_R_squared = r_squared
)

write.csv(evaluation, "model_evaluation.csv",
          row.names = FALSE)

png("actual_vs_predicted.png")

plot(
  test_data$Volume, predictions,
  main = "Actual vs Predicted Tree Volume",
  xlab = "Actual Volume (cubic feet)",
  ylab = "Predicted Volume (cubic feet)",
  pch = 19,
  col = "blue"
)

abline(a = 0, b = 1, col = "red", lty = 2)

dev.off()
# Save the trained regression model
saveRDS(model, "tree_volume_model.rds")

# Display the files in your project folder
list.files()
