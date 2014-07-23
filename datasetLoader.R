# DataSet load function
loadDS <- function(aDocId, aDataSetFile, aSubjectFile, anActivityLabelFile) {
  # load dataset
  ds_tmp <- read.table(aDataSetFile, sep = "", header = F, col.names = ds_colnames[[2]], row.names = NULL)
  # trim to mean and std deviation columns
  ds_tmp <- ds_tmp[,grepl("(mean)|(std)", names(ds_tmp), ignore.case = T)]
  # add subject
  ds_tmp <- cbind(ds_tmp, read.table(aSubjectFile, header = F, col.names = "subject"))
  # add labels
  ds_tmp <- cbind(ds_tmp, read.table(anActivityLabelFile, header = F, col.names = "activity_id"))
  # add activity labels
  ds_tmp <- merge(x = ds_tmp, y = ds_activitylabels, by.x = "activity_id", by.y = "activity_id", all.x = T, all.y = F)
  # add source
  ds_tmp$docid <- aDocId
  # return data frame
  return(ds_tmp)
}
