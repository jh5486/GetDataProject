# GetDataProject
Getting and Cleaning Data Class Project - Coursera

# CODEBOOK

# STEP 1
  Downloading data file, unzip the file and put it in a "dataset" folder
  Set the variable `directory` <- file.path("./dataset/UCI HAR Dataset")

  Assign descriptive variable names
	For the relevant data downloaded to `directory`, defined three 
	categories `Feature`, `Activity`, `Subject` for the data set.

 Read the dataset list of files and assign to variables as data frame

 Merges the training and the test files to create one data set `DataSet1`
	1. Combine the data frames `subject`, `activity`, `feature` by rows using `rbind`
	2. Assign names `subject`, `activity`, `feature` data frame
	3. Combine the `subject` & `activity` & `feature` as DataSet1 for all data

# STEP 2 & 3
  Extracts only the measurements on the mean and standard deviation for each measurement
	1. Subset Name of Features by measurements on the “mean()” and standard deviation “std()”
	2. Subset the data frame Data by selected names of Features
	3. Uses descriptive activity names to name the activities in the data set

# STEP 4
  Appropriately labels the data set with descriptive variable names
	Names of `Feature` are labeled using descriptive variable names.

# STEP 5
  Creates a second,independent tidy data set and output as "tidydataset.txt"
	From the data set in step 4, creates a second, independent tidy data set 
	with the average of each variable for each activity and each subject.

# Create Codebook