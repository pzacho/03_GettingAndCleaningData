# Coursera course for Getting and Cleaning Data
# Submitted by Per Zacho, July 2014

# Download data file if not existing
if (!file.exists("./work/dataset.zip")) {
  # create work directory
  if (!file.exists("./work")) {
    dir.create("./work")
  }
  # download data files
  download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "./work/dataset.zip", method = "curl")
  # unpack
  unzip(zipfile = "./work/dataset.zip", overwrite = T, exdir = "./work")
}

# load column names
ds_colnames <- read.table("./work/UCI HAR Dataset/features.txt", header = F)

# load activity labels
ds_activitylabels <- read.table("./work/UCI HAR Dataset/activity_labels.txt", header = F)

# load test dataset
ds_tst <- read.table("./work/UCI HAR Dataset/test/X_test.txt", sep = "", header = F, col.names = ds_colnames[[2]], row.names = NULL)
# add test subject
ds_tst$subject <- read.table("./work/UCI HAR Dataset/test/subject_test.txt", header = F, col.names = "subject")
# add source
ds_tst$docid <- "X_test.txt"

# load train dataset
ds_train <- read.table("./work/UCI HAR Dataset/train/X_train.txt", sep = "", header = F, col.names = ds_colnames[[2]])
# add test subject
ds_train$subject <- read.table("./work/UCI HAR Dataset/train/subject_train.txt", header = F, col.names = "subject")
# add source
ds_train$docid <- "X_train.txt"

# merge into one dataset
ds_merge <- merge(ds_tst, ds_train, by.x = "docid", by.y = "docid", all = T)

# extract mean and standard deviation on all measurements
ds_result <- ds_merge[,grepl("(mean)|(std)|(docid)|(subject)", ds_merge, ignore.case = T)]
