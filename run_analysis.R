# Coursera course for Getting and Cleaning Data
# Submitted by Per Zacho, July 2014

source("datasetLoader.R")

# Download data file if not existing
dateDownloaded <- NULL

if (!file.exists("./work/dataset.zip")) {
  # create work directory
  if (!file.exists("./work")) {
    dir.create("./work")
  }
  # download data files
  download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "./work/dataset.zip", method = "curl")
  # unpack
  unzip(zipfile = "./work/dataset.zip", overwrite = T, exdir = "./work")
  # note date of download
  dateDownloaded <- date()
  # write to file
  save(dateDownloaded, file = "./work/dateDownloaded")
} else
  dateDownloaded <- load(file = "./work/dateDownloaded")

# load column names
ds_colnames <- read.table("./work/UCI HAR Dataset/features.txt", header = F)
# load activity labels
ds_activitylabels <- read.table("./work/UCI HAR Dataset/activity_labels.txt", header = F, col.names = c("activity_id", "activity"))

# load test dataset
ds_tst <- loadDS("X_test.txt", "./work/UCI HAR Dataset/test/X_test.txt", "./work/UCI HAR Dataset/test/subject_test.txt", "./work/UCI HAR Dataset/test/y_test.txt")
# load train dataset
ds_train <- loadDS("X_train.txt", "./work/UCI HAR Dataset/train/X_train.txt", "./work/UCI HAR Dataset/train/subject_train.txt", "./work/UCI HAR Dataset/train/y_train.txt")

# merge into one dataset
ds_merge <- rbind(ds_train, ds_tst)

# create average 
ds_tidy <- aggregate(ds_merge, by = list(subjectGrp=ds_merge$subject, activityGrp=ds_merge$activity, docidGrp=ds_merge$docid), FUN = "mean")
# remove superflous columns
ds_tidy <- ds_tidy[,!(names(ds_tidy) %in% c("subject", "activity", "docid"))]