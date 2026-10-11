# Forest Tree Data Analysis and Volume Prediction Using R

## Project Overview

This project focuses on analyzing forest tree measurements using R programming. It studies the relationship between tree girth, height, and volume and uses a linear regression model to predict tree volume.

## Objectives

- Analyze tree measurement data using R.
- Perform data cleaning and preprocessing.
- Calculate descriptive statistics.
- Visualize tree measurements using graphs.
- Study the correlation between girth, height, and volume.
- Build a linear regression model to predict tree volume.
- Evaluate the model using regression metrics.

## Dataset

The project uses the built-in `trees` dataset in R, which contains measurements of 31 black cherry trees.

The dataset contains three variables:

- **Girth:** Tree girth measurement.
- **Height:** Tree height in feet.
- **Volume:** Tree volume in cubic feet.

The dataset was exported to CSV format for analysis.

## Tools and Technologies

- R Programming
- RStudio
- CSV dataset
- Data visualization
- Statistical analysis
- Multiple linear regression

## Project Workflow

1. Load the tree dataset into R.
2. Check the dataset structure and summary.
3. Check for missing values and duplicate records.
4. Calculate descriptive statistics.
5. Create graphs to visualize tree measurements.
6. Perform correlation analysis.
7. Split the data into training and testing sets.
8. Train a multiple linear regression model.
9. Predict tree volume using girth and height.
10. Evaluate the model using R-squared, RMSE, and MAE.

## Model Used

**Multiple Linear Regression**

The model uses Girth and Height as input variables to predict Volume.

The fitted model equation is:

`Volume = -62.626 + 4.785 × Girth + 0.389 × Height`

## Results

The analysis found a strong positive correlation between Girth and Volume, with a correlation coefficient of approximately 0.967.

The model evaluation results were:

- Training R-squared: 0.9501
- Test R-squared: approximately 0.919
- Test RMSE: approximately 3.53
- Test MAE: approximately 2.52

The test dataset contained only seven observations, so the results should be interpreted with caution.

## Conclusion

This project demonstrates how R programming can be used to analyze tree measurements and predict tree volume. The analysis shows that girth has a strong relationship with volume, while the regression model uses both girth and height to estimate volume.

## Reference

R Documentation – Trees Dataset:

https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/trees.html
