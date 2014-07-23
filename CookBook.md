CookBook
========

##Step by step description of creating tidy data set
####Coursera course: Getting and Cleaning Data

#####Steps
1. Check if .zip file is existing in the **work** directory.

  * If not, the file is downloaded and stored under the name **./work/dataset.zip**
  * A timestamp file is created to note when the file was downloaded. This is stored in the file **./work/dateDownloaded**
  * The zip file is extracted in the **./work/UCI HAR Dataset** directory 

2. The two data sets are loaded:

  * Loading is performed by the `loadDS` function, performing the following steps
    * Load the csv file into temporary variable
    * Column names are being assigned from the file **./work/UCI HAR Dataset/features.txt**
    * All but column names including __mean__ or __std__ are being stripped
    * The subject (person) measuring is added to column __subject__
    * The activity label id is added to column __activity_id__
    * The textual presentation of the activity is merged and represented in column __activity__
    * A source document is added in column __docid__
    * The temporary data frame is returned
     
  * `ds_tst` is holding the test data set is loaded using `loadDS`
  * `ds_train` is holding the train data set is loaded using `loadDS`
  
3. The two datasets `ds_tst` and `ds_train` are being merged into `ds_merged`

4. An agregated dataset `ds_tidy` is being calculated, agregating on the following columns:

  * __docid__
  * __activity__
  * __subject__
  
