---
output: html_document
---
# Getting and Cleaning Data: Code Book

Following the steps described in [README.md](https://github.com/halbut/Getting_and_Cleaning_Data/blob/master/README.md), I cleaned up the data and output it to the file [UCI_HAR_tidy.txt](https://github.com/halbut/Getting_and_Cleaning_Data/blob/master/UCI_HAR_tidy.txt). The details are below.

## Raw data

Their data was obtained from carrying out experiments with 30 participants performing six different activities while wearing a smartphone. The data was randomly split into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. Using the phone's embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  

The raw data is distributed among 3 different folders:

1. UCI HAR Dataset folder:  
  * `features.txt` contains 561 names of the time and frequency domain variables
2. train folder:
  * `X_train.txt`: Data of the 561 features for each subject in the training set
  * `y_train.txt`: Activity labels for the training set
  * `subject_train.txt`: Each row identifies the subject who performed the activity for each window sample
3. test folder:
  * `X_test.txt`: Data of the 561 features for each subject in the test set
  * `y_test.txt`: Activity labels for the test set
  * `subject_test.txt`: Each row identifies the subject who performed the activity for each window sample

 For more detailed information on the original data set, please see: [README.txt](https://github.com/halbut/Getting_and_Cleaning_Data/blob/master/UCI_HAR_Dataset/README.txt).
 
 
### Variable Name Coding:

The identifiers are as follows:

- participant - the participant number (1-30) 
- activity - the activity description

The vector information contains 81 rows that are compromised of many elements for each measurement. Here is a list of codes used while naming the measurements:

Code name | Description
----------|------------
`-x`      | X Axis
`-y`      | Y Axis
`-z`      | Z Axis
`Acc`     | acceleration - m/s^2 
`Gyro`    | gyroscope: angular velocity - radians/s
`Mag`     | magnitude using the Euclidean norm
`mean`    | average
`std`     | standard deviation
`t`       | time prefix (indicating measurement's domain)
`f`       | frequency prefix (indicating measurement's domain)
`Jerk`    | jerk - m/s^3  
`Body`    | the person's own movement  
`Gravity` | movement due to gravity

For example "tBodyGyro-mean()-Z" denotes a measurement of the mean of a person's own movement's angular velocity along the z axis as calculated using time. 

All the variables were are normalized and bounded within [-1,1].

### Transformations

The identifier column names were given more appropriate labels such as "activity" (of each person) and "subject" (volunteers who participated in the experiment). The vector measurement column names were renamed according to the features text file. The numeric labels for activities were converted to descriptive ones using the activity_labels file:

1. WALKING                                                                                                                                        
2. WALKING_UPSTAIRS                                                                                                                               
3. WALKING_DOWNSTAIRS                                                                                                                             
4. SITTING                                                                                                                                        
5. STANDING                                                                                                                                       
6. LAYING 


## Cleaned-up data

The tidy data set contains the average of each variable for each activity and each subject. 10299 instances are split into 180 groups (30 subjects with 6 activities each) and 62 mean and standard deviation features are averaged for each group, thus the resulting data table has 180 rows and 62 columns.
