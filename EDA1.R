# 1 (iris)

# Loading iris dataset(inbuilt dataset).

data("iris")
iris

# viewing iris dataset.
summary(iris)
dim(iris)
head(iris)
tail(iris)
str(iris)

# Creating Boxplot for all the 4 features.
par(mfrow = c(2, 2))

# Calculating Empirical IQR for each feature.
iqr_sepal_length <- IQR(iris$Sepal.Length) 
iqr_sepal_width <- IQR(iris$Sepal.Width)
iqr_petal_length <- IQR(iris$Petal.Length)
iqr_petal_width <- IQR(iris$Petal.Width)

# printing Empirical IQR for each feature.
iqr_sepal_length
iqr_sepal_width
iqr_petal_length
iqr_petal_width

# Finding Feature with largest Empirical IQR.
maximum_emp_iqr <- max(iqr_sepal_length, iqr_sepal_width, iqr_petal_length, 
                       iqr_petal_width)
maximum_emp_iqr

# Petal.Length has the maximum IQR of 3.5.

# This means iqr_petal_length (3.5) has the maximum empirical IQR.

# Creating Boxplot for each feature.

# Boxplot for Sepal.Length.

boxplot(iris$Sepal.Length,
        main = "Boxplot of Sepal Length feature",
        xlab = "species",
        ylab = "Sepal Length",
        col = ifelse(iqr_sepal_length == maximum_emp_iqr, "chartreuse", "white"))

# Boxplot for Sepal.Width.

boxplot(iris$Sepal.Width,
        main = "Boxplot of Sepal Width feature",
        xlab = "species",
        ylab = "Sepal Width",
        col = ifelse(iqr_sepal_width == maximum_emp_iqr, "chartreuse", "white"))

# Boxplot for Petal.Length.

boxplot(iris$Petal.Length,
        main = "Boxplot of Petal Length feature",
        xlab = "species",
        ylab = "Petal Length",
        col = ifelse(iqr_petal_length == maximum_emp_iqr, "chartreuse", "white"))

# Boxplot for Petal.Width

boxplot(iris$Petal.Width,
        main = "Boxplot of Petal Width feature",
        xlab = "species",
        ylab = "Petal Width",
        col = ifelse(iqr_petal_width == maximum_emp_iqr, "chartreuse", "white"))

# Calculating the parametric standard deviation for each feature.

sd(iris$Sepal.Length)
sd(iris$Sepal.Width)
sd(iris$Petal.Length)
sd(iris$Petal.Width)

# To use ggplot2
library (ggplot2)

# ggplot for sepal length.
ggplot (iris, aes(Species,Sepal.Length, fill = Species)) +
  geom_boxplot () + 
  ggtitle("Sepal length boxplot with a box-whisker/species") + 
  xlab("Species") + 
  ylab("Sepal.Length") + 
  theme(legend.position = "none")

# ggplot for sepal width.
ggplot(iris, aes (Species,Sepal.Width, fill = Species)) + 
  geom_boxplot () + 
  ggtitle ("Sepal width boxplot with a box-whisker/species") + 
  xlab("Species") + 
  ylab ("Sepal.Width") + 
  theme (legend.position = "none")

# ggplot for petal length.
ggplot (iris, aes (Species,Petal.Length, fill = Species)) +
  geom_boxplot () + 
  ggtitle ("Petal length boxplot with a box-whisker/species") + 
  xlab("Species") + 
  ylab ("Petal.Length") + 
  theme (legend.position = "none")

# ggplot for petal width.
ggplot (iris, aes (Species,Petal.Width, fill = Species)) +
  geom_boxplot () + 
  ggtitle ("Petal width boxplot with a box-whisker/species") + 
  xlab("Species") + 
  ylab ("Petal.width") + 
  theme (legend.position = "none") 

# Inference
# Thus the observed result matches with the parametric result where Petal.Length has the 
# maximum IQR of 3.5.

# loading trees dataset(inbuilt dataset).

# 2 (trees)

data(trees)

# Viewing dataset.
trees
summary(trees)
dim(trees)
head(trees)
tail(trees)
str(trees)

# creating Histogram for all the 3 features.
par (mfrow = c (1,3))

hist(trees$Girth, 
     col = "chartreuse",
     main = "Histogram for Girth",
     xlab = "Girth")
hist(trees$Height, 
     col = "chartreuse", 
     main = "Histogram for Height",
     xlab = "Height")
hist(trees$Volume,
     col = "chartreuse",
     main = "Histogram for Volume",
     xlab = "Volume")

# Loading moments.
library(moments)

# Finding skewness for each feature.
skewness(trees$Girth)
skewness(trees$Height)
skewness(trees$Volume)

# Inference
# The trees$height appears to be normally distributed.
# Skewness value of Girth and Volume have positive value and height has negative value.
# The values from the skewness function ‘agree’ with the visual inspection from the histogram.

# 3 (auto_mpg)

# Loading dataset from the UCI Machine Learning Repository.
auto_mpg_dataset ="https://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data"
amd <- read.csv(file = auto_mpg_dataset, header = FALSE, sep = "", as.is = (4&9))

# Viewing Dataset.

amd
dim(amd)
summary(amd)
head(amd)
tail(amd)

# Loading the required libraries.
library(dplyr)
library(tidyr)

# Renaming the columns.
colnames(amd) <- c("mpg", "cylinders", "displacement", "horsepower", "weight", "acceleration", "model year", "origin", "car name")

# Converting "horsepower" to numeric (if not already).
amd$horsepower <- as.numeric(amd$horsepower)

# Checking for missing values in the "horsepower" column.
missing_horsepower <- table(is.na(amd$horsepower))
cat("\nTable of Missing Values in 'horsepower' column:\n")
print(missing_horsepower)

# Calculating and print the mean of "horsepower" (excluding missing values).
mean_horsepower_before <- mean(amd$horsepower, na.rm = T)
cat("\nMean of Horsepower with missing values:", mean_horsepower_before, "\n")

# Calculating and print the median of "horsepower" (excluding missing values).
median_horsepower_before <- median(amd$horsepower, na.rm = T)
cat("Median of Horsepower with missing values:", median_horsepower_before, "\n")

# Replace missing values in "horsepower" with the median
amd <- amd %>%
  mutate(across(horsepower, 
                ~ ifelse(is.na(.), 
                         median(., na.rm = TRUE), .)))

# Calculate and print the mean of "horsepower" after replacing missing values
mean_horsepower_after <- mean(amd$horsepower, na.rm = T)
cat("\nMean of Horsepower after replacing missing values:", mean_horsepower_after, "\n")

# Inference
# When some rows are missed, we get mean value as 104.4694 and when we replace missing
# values with NA, we get mean as 104.304 which is lesser. 

# 4 ()

# Loading dataset.
library(MASS)

# viewing boston dataset.
boston_sample_dataset <- data.frame(Boston)
boston_sample_dataset
dim(boston_sample_dataset)
head(boston_sample_dataset)
tail(boston_sample_dataset)
str(boston_sample_dataset)

# Fitting a linear regression model with "medv" as the dependent variable 
# and "lstat" as the independent variable.
lrm <- lm(medv ~ lstat, data = boston_sample_dataset)

# Displaying a summary of the linear regression model.
summary(lrm)

# Create a scatterplot of "lstat" (x-axis) against "medv" (y-axis) 
# using the "boston_sample_dataset" data.
plot(boston_sample_dataset$lstat, 
     boston_sample_dataset$medv, 
     pch = 15, 
     xlab = "lstat", 
     ylab = "medv", 
     col = "grey")

# Overlaying a regression line on the scatterplot.
abline(lrm, lwd = "4")

# Setting the plotting parameters: 2x2 grid layout and margin adjustments.
par(mfrow = c(2, 2), mar = c(3, 3, 3, 3))

# Creating diagnostic plots for the linear regression model.
plot(lrm, col = "chartreuse")

# Predicting response variable "medv" for specific values of "lstat" (5, 10, and 15)
# and calculate the confidence intervals.
predict(lrm, data.frame(lstat = (c(5,10,15))),interval = "confidence")

# Predict response variable "medv" for specific values of "lstat" (5, 10, and 15)
# and calculate the prediction intervals.
predict(lrm, data.frame(lstat = (c(5,10,15))),interval = "prediction")

# Create a new linear regression model (lmr2) to predict 
# "medv" based on "lstat" and its quadratic term
lmr2 <- lm(boston_sample_dataset$medv ~ 
             boston_sample_dataset$lstat + 
             I(boston_sample_dataset$lstat^2))

# Setting the plotting parameters: 2x2 grid layout and margin adjustments.
par(mfrow = c(2, 2), mar = c(3, 3, 3, 3))

# Creating diagnostic plots for the quadratic linear regression model (lmr2).
plot(lmr2, col = "chartreuse")

# Summary of lm2.
summary(lmr2)

# It appears that there is a non linear relationship between predictor and
# response variables.
# The confidence and prediction are not the same. So there is non linearity 
# between data.