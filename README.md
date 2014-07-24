03_GettingAndCleaningData
=========================

##General README
####Coursera course: Getting and Cleaning Data

#####Steps
The R script `run_analysis.R` is downloading and tidying up a training and test data set collected using mobile phones.

The original data consists of 500+ measurements, but for this excercise reduced to about 90.

#####Variables
The following list is the variables used:

* `ds_tst` is holding the test data set
* `ds_train` is holding the training data set
* `ds_merge` is holding the `rbind()` merger of the above data sets
* `ds_tidy` is holding the tidy data set

* `dateDownloaded` is the date and time stamp of the .zip file download
* `ds_colnames` is holding the names of the columns in the combined test and training data set
* `ds_activitylabels` is holding the textual representation of the subject activities

