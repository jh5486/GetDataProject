##===========================================================================
## Getting and Cleaning Data Course Project
## Start: 3/16/2015
## Due Date: Sun 3/29/2015 @ 4:30pm Pacific
## Version: 1.0
##===========================================================================
#' Instruction:
# Create one R script called run_analysis.R that does the following: 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for 
#    each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data 
#    set with the average of each variable for each activity and each subject.
#---------------------------------------------------------------------------
#' 1. Downloads data file, unzip the file and put it in a "dataset" folder
#---------------------------------------------------------------------------
  #+ Set the variable `directory` <- file.path("./dataset/UCI HAR Dataset")
  setwd("~/R_PROGRAMMING/GetDataProject")
  setInternet2(TRUE)

  if(!file.exists("./dataset")){
    dir.create("./dataset")
    fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl,destfile="./dataset/Dataset.zip",method="auto")

  #+ Unzip the file to the folder "UCI HAR Dataset"
    unzip(zipfile="./dataset/Dataset.zip",exdir="./dataset")
  }
  #+ Get the files from the downloaded "dataset" folder
  directory <- file.path("./dataset/UCI HAR Dataset")
  files_list <- list.files(directory, recursive=TRUE)
#---------------------------------------------------------------------------
#' 2. Assigns descriptive variable names
#---------------------------------------------------------------------------
#  For the relevant data downloaded to `directory`, defined three 
#  categories `Feature`, `Activity`, `Subject` for the data set:
#   a. Feature 
#       - `featureName`      (from file `features.txt`)
#       - `featureTest`      (from file `X_test.txt`)
#       - `featureTrain`     (from file `X_train.txt`)
#   b. Activity           
#       - `activityName`     (from file `activity_labels.txt`)
#       - `activityTest`     (from file `Y_test.txt`)
#       - `activityTrain`    (from file `Y_train.txt`)
#   c. Subject
#       - `subjectTest`      (from file `subject_test.txt`)
#       - `subjectTrain`     (from file `subject_train.txt`)

#' Reads the dataset list of files and assign to variables as dataframe
  featureTest  <- read.table(file.path(directory, "test", "X_test.txt" ),header = FALSE)
  featureTrain <- read.table(file.path(directory, "train", "X_train.txt"),header = FALSE)
  activityTest <- read.table(file.path(directory, "test", "Y_test.txt" ),header = FALSE)
  activityTrain <- read.table(file.path(directory, "train", "Y_train.txt"),header = FALSE)
  subjectTrain <- read.table(file.path(directory, "train", "subject_train.txt"),header = FALSE)
  subjectTest  <- read.table(file.path(directory, "test", "subject_test.txt"),header = FALSE)
  featureName <- read.table(file.path(directory, "features.txt"),head=FALSE)
  activityName <- read.table(file.path(directory, "activity_labels.txt"),header = FALSE)
#---------------------------------------------------------------------------
#' 3. Merges the training and the test files to create one data set `DataSet1`
#---------------------------------------------------------------------------
  # a. Combine the data frames `subject`, `activity`, `feature` by rows using `rbind`
  subject <- rbind(subjectTrain, subjectTest)
  activity <- rbind(activityTrain, activityTest)
  feature <- rbind(featureTrain, featureTest)

  # b. Assign names `subject`, `activity`, `feature` data frame
  names(subject) <- c("subject")
  names(activity) <- c("activity")
  names(feature) <- featureName$V2
  library(plyr)
  colnames(activityName) <- c("activity", "activity_name")
  act_name <- data.frame(join(activityName, activity, by = "activity", type = "right", match = "all"))
  
  # c. Combine the `subject` & `activity` & `feature` as DataSet1 for all data
  combined_subject_activity <- cbind(subject, activity)
  myDataSet <- cbind(feature, combined_subject_activity)
  str(myDataSet)
#---------------------------------------------------------------------------
#' 4. Extracts only the measurements on the mean and standard deviation for each measurement
#---------------------------------------------------------------------------
# a. Subset Name of Features by measurements on the "mean()" and standard deviation "std()"
  mean_std_FeatureName <- subset(featureName$V2, grepl("mean\\(\\)|std\\(\\)", featureName$V2))

# b. Subset the data frame `DataSet1` by selected names of Features
  subFeature <-c("subject", "activity",as.character(mean_std_FeatureName))
  DataSet1<-subset(myDataSet,select=subFeature)
  str(DataSet1)
#---------------------------------------------------------------------------
#' 5. Uses descriptive activity names to name the activities in the data set
#---------------------------------------------------------------------------
# Appropriately labels list of variables of each feature vector in `features.txt` 
# file with descriptive variable names:
  names(DataSet1)<-gsub("^t", "time", names(DataSet1))
  names(DataSet1)<-gsub("^f", "frequency", names(DataSet1))
  names(DataSet1)<-gsub("Acc", "Accelerometer", names(DataSet1))
  names(DataSet1)<-gsub("Gyro", "Gyroscope", names(DataSet1))
  names(DataSet1)<-gsub("Mag", "Magnitude", names(DataSet1))
  names(DataSet1)<-gsub("BodyBody", "Body", names(DataSet1))
#---------------------------------------------------------------------------
#' 6. Creates a second,independent tidy data set and output as "dataset2.txt"
#---------------------------------------------------------------------------
# From the data set `DataSet1` in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
  library(dplyr)
  DataSet2 <- ddply(DataSet1, .(subject,activity), numcolwise(mean))
  DataSet2$activity <- act_name[match(DataSet2$activity, act_name$activity), 2]
  DataSet2 <- DataSet2[with(DataSet2, order(subject, activity)), ]
  str(DataSet2)

  write.table(DataSet2, file = "dataset2.txt",row.name=FALSE)
#---------------------------------------------------------------------------
#' Creates Codebook
# rmarkdown::render("run_analysis.R")
#
#---------------------------------------------------------------------------





