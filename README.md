# EDA1

Exploratory data analysis  of 4 datasets.

# IRIS
Successfully loaded the Iris dataset into R, performed summary statistics, and visualized the data through boxplots to identify the feature with the largest empirical interquartile range (IQR).Calculated and compared the empirical IQR and parametric standard deviation for each feature, demonstrating consistency in results and statistical analysis.
Utilized the ggplot2 library to create informative and visually appealing boxplots for each feature, categorizing the data by flower species, highlighting the significant variation in Petal Length/Width among the classes. Identified and presented Petal.Length as the feature with the maximum empirical IQR, supported by both graphical and parametric analysis, showcasing a comprehensive understanding of data visualization and statistical techniques.

# TREES
Successfully loaded and analyzed the trees dataset in R, obtaining a comprehensive understanding of the dataset's structure and summary statistics for each feature. Utilized histograms to visually inspect the distribution of each variable, identifying the "height" variable as normally distributed and recognizing potential skewness in the "Girth" and "Volume" variables. Installed and utilized the moments library to calculate skewness values for each variable, revealing positive skewness for "Girth" and "Volume" and negative skewness for "Height". Demonstrated consistency between visual inspection and statistical analysis, with skewness values aligning with the observed distribution patterns, showcasing proficiency in data exploration and statistical techniques.

# AUTO-MPG

Successfully loaded the auto-mpg dataset from the UCI Machine Learning Repository into R, handling missing values in the "horsepower" column, and renaming columns for clarity. Utilized data manipulation and the as.numeric function to convert the "horsepower" column to a numeric format while treating missing values as NAs. Replaced missing values in the "horsepower" column with the median value, ensuring data completeness and robustness in subsequent analysis. Compared and reported the mean of the "horsepower" column before and after replacing missing values, demonstrating the impact of imputation on the statistical measure, showcasing proficiency in data preprocessing and analysis.

# BOSTON
Successfully loaded the Boston sample dataset from the MASS package into R, conducting initial data exploration and summary statistics. Fitted a linear regression model between the "medv" (median house value) and "lstat" (percentage of lower status population) variables, followed by plotting the regression fit and diagnostic plots, which hinted at potential non-linearity.Utilized the predict function to calculate response values for "lstat" values of 5, 10, and 15 while obtaining both confidence intervals and prediction intervals, demonstrating an understanding of prediction uncertainty. Modified the regression model to include a quadratic term "lstat^2" and compared it to the linear model, emphasizing the exploration of non-linear relationships and evaluation of model fit using ggplot2 and stat smooth, showcasing proficiency in advanced regression analysis.


