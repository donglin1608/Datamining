# Step 1: Load Required Libraries
library(readr)     # For data import
library(dplyr)     # For data manipulation
library(ggplot2)   # For data visualization
library(caret)     # For machine learning
library(rpart)     # For decision trees (optional)


# Step 2: Load Data
text_content <-"/Users/donglinxiong/Downloads/BI_03_text/structureUnstructure.txt
just_text <- scan(text_content, character(0), sep = "\n")

# Display the first 10 lines of the text
head(just_text, 10)


#split data into training and testing sets
set.seed(123)
inTrain <- createDataPartition(y = just_text, p = 0.8, list = FALSE)
training <- just_text[inTrain]
testing <- just_text[-inTrain]

# Train a machine learning model decision tree
training <- as.data.frame(training)
model <- rpart(training ~ ., data = training, method = "class")

#Make predictions
predictions <- predict(model, testing, type = "class")

#Evaluate model performance
confusionMatrix(predictions, testing)

# Plot the decision tree



# Step 3: Data Preprocessing
# Convert text to lower case
text_content <- tolower(text_content)
summary(text_content)


