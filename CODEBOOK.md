# Getting and Cleaning Data Class Project - Coursera

# CODEBOOK

## CONTENTS:

- [Gets Input Files](#Gets-Input-Files)
- [Merges & Combines Data](#Gets-Merge-Data)
- [Extracts Measurement and Calculates Mean & Standard Deviation](#Extracts-Measurement-and-Calculates-Mean-Standard-Deviation)
- [Assigns descriptive names to Measurement](#Assigns-descriptive-names-to-Measurement)
- [Creates 2nd tidy Dataset](#Creates-2nd-tidy-Dataset)

<a name="Gets-Input-Files"/>

## STEP 1
### Downloading data file, unzip the file and put it in a `dataset` folder
+ Set the variable `directory` <- `file.path("./dataset/UCI HAR Dataset"`)

### Assign descriptive variable names
+ For the relevant data downloaded to `directory`, defined three 
  categories `Feature`, `Activity`, `Subject` for the data set.

### Read the dataset list of files and assign to variables as data frame

<a name="Gets-Merge-Data"/>

## STEP 2
### Merges the training and the test files to create one data set `DataSet`
 1. Combine the data frames `subject`, `activity`, `feature` by rows using `rbind`
 2. Assign names `subject`, `activity`, `feature` data frame
 3. Combine the `subject`, `activity` & `feature` as `DataSet` for all data

## `str(myDataSet)`
## `'data.frame':    10299 obs. of  563 variables:`

<a name="Extracts-Measurement-and-Calculates-Mean-Standard-Deviation"/>

## STEP 3
### Extracts only the measurements on the mean and standard deviation for each measurement
 1. Subset Names of `Feature` by measurements on the `“mean()”` and standard deviation `“std()”`
 2. Subset the data frame `DataSet1` by selected names of Features
 3. Uses descriptive activity names to name the activities in the data set

## `str(DataSet1)## 'data.frame':    10299 obs. of  68 variables:`

<a name="Assigns-descriptive-names-to-Measurement"/>
## STEP 4
### Appropriately labels the data set with descriptive variable names
 Names of `Feature` are labelled using descriptive variable names.

<a name="Creates-2nd-tidy-Dataset"/>
## STEP 5
### Creates a second,independent tidy data set and output as `"dataset2.txt"`
 From the data set in step 4, creates a second, independent tidy data set 
 with the average of each variable for each activity and each subject.

##  `str(DataSet2)`
## `'data.frame':    180 obs. of  68 variables:`


  
## Create Codebook
### 
+  # rmarkdown::render("run_analysis.R")
