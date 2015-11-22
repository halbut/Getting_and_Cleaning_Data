---
output: html_document
---
# Course Project - Getting and Cleaning Data

## Background

One of the most exciting areas in all of data science right now is wearable computing - see for example 
[this article](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Contents of this directory:

### UCI_HAR_Dataset
   This is the raw data used for in this exercise (as mentioned above: [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)).
   
### CodeBook.md
   The Code Book ([source](https://github.com/halbut/Getting_and_Cleaning_Data/blob/master/Codebook.md)), contains infomation regarding each of the variables and observations. It also include information each measurement, data type, and units, as well as aggregations and consolidations.
   
### run_analysis.R

This script does the following:  

1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.  
3. Uses descriptive activity names to name the activities in the data set.  
4. Appropriately labels the data set with descriptive variable names.  
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

### UCI_HAR_tidy.txt
   Contains the tidy data, i.e. a complete set of the means and standard deviations by subject and activity, created with write.table() using row.name=FALSE.


## How to run
  Just run the "run_analysis.R" script in any directory. It will download, extract and clean up the data, and then generate the output data file (as described above).  At the end of the process, that table is stored into a file called "UCI_HAR_tidy.txt" where the first row is the header containing the names for each column, so it can be read using the command:

tidyData <- read.table('UCI_HAR_tidy.txt', header = TRUE, sep="", strip.white=TRUE)
