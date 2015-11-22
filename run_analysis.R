library(plyr)

setwd("~/Documents/New/Getting_and_Cleaning_Data/Getting_and_Cleaning_Data_repo")

dataDir <- "./UCI_HAR_Dataset/"

verbose <- TRUE

loadData <- function() {
   url<-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
   zippedDataFile <- "UCI_HAR_Dataset.zip"
   origDataDir <- "UCI HAR Dataset"
   
   if (!file.exists(dataDir)) {
      if(!file.exists(zippedDataFile)){
         print("Downloading data file")
         download.file(url, destfile = zippedDataFile)
      }
      print("Unzipping data file")
      unzip(zippedDataFile)
      file.rename(origDataDir, dataDir)
   } else {
     print("Data directory already exists")
   }

   print("Done loading the data")
}

# Merge training and test datasets
merge <- function() {
  train.x <- read.table(paste(dataDir,"train/X_train.txt",sep=""), header=FALSE, sep="",strip.white=TRUE)
  train.y <- read.table(paste(dataDir,"train/y_train.txt",sep=""))
  train.subject <- read.table(paste(dataDir,"train/subject_train.txt",sep=""))
  
  test.x <- read.table(paste(dataDir,"test/X_test.txt",sep=""), header=FALSE, sep="",strip.white=TRUE)
  test.y <- read.table(paste(dataDir,"test/y_test.txt",sep=""))
  test.subject <- read.table(paste(dataDir,"test/subject_test.txt",sep=""))
  
  if (verbose) {
    print("Size of the fields read:")
    print(length(train.x))
    print(length(test.x))
  }
  
  # merge training data and test datasets
  merged.x <- rbind(train.x, test.x)
  merged.y <- rbind(train.y, test.y)
  merged.subject <- rbind(train.subject, test.subject)

  mergedList <- list(x=merged.x, y=merged.y, subject=merged.subject)
  
  print("Done merging the data")
  
  mergedList
}


# Given the dataset, extract only the measurements on the mean and standard deviation for each measurement.
extractMeanAndStd = function(dataset) {

  features <- read.table(paste(dataDir,"features.txt",sep=""), header=FALSE)

  if (verbose) {
    print("Size of the fields read:")
    print(length(features))
  }

  meanAndStdColumns <-grep("mean()|std()", features$V2)
  
  newDataset <- dataset[, meanAndStdColumns]
  colnames(newDataset) <- features[meanAndStdColumns, 2]
  
  print("Done extracting mean and standard error columns")
  
  newDataset
}

nameActivities = function(dataset) {
  activityLabels <- read.table(paste(dataDir,"activity_labels.txt",sep=""),
                               header=FALSE, stringsAsFactors = FALSE)
  
  activityLabels <- activityLabels$V2

  colnames(dataset) <- "activity"
  
  dataset$activity <- mapvalues(dataset$activity, 
                                from = levels(factor(dataset$activity)), 
                                to = activityLabels)

  rm("activityLabels")

  print("Done naming activities")
  
  dataset
}

loadData()
merged <- merge()
x_values <- extractMeanAndStd(merged$x)
y_values <- nameActivities(merged$y)
colnames(merged$subject) <- c("subject")

# create an independent tidy dataset with the average of each variable for each activity and each subject.
tidy <- ddply(cbind(x_values, y_values, merged$subject), .(subject, activity), function(x) colMeans(x[,1:60]))

print("Done binding the data")

if (verbose) {
  print("Size of the tidy table generated:")
  print(dim(tidy))
}

write.table(tidy, "UCI_HAR_tidy.txt", row.names=FALSE)

print("Done writing out the tidy dataset")

