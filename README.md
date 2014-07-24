03_GettingAndCleaningData
=========================

##General README
####Coursera course: Getting and Cleaning Data

#####Steps
The R script `run_analysis.R` is downloading and tidying up a training and test data set collected using mobile phones.

The original data consists of 500+ measurements, but for this excercise reduced to about 90.

#####Contents
The script `run_analysis.R` will automatically download data if not available in working directory.

The script calls `datasetLoader.R` for the actual loading of respectively the test and training data set.

See the *CookBook.md* for details on variables and the data tidying executed. 