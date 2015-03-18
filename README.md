# Getting and Cleaning Data Class Project - Coursera

Contents:

- [Instruction](#Instruction)
- [Procedure](#Procedure)

<a name="Instruction"/>

## Instruction:
### Create one R script called `run_analysis.R` that does the following: 
+ 1. Merges the training and the test sets to create one data set.
+ 2. Extracts only the measurements on the mean and standard deviation for 
    each measurement. 
+ 3. Uses descriptive activity names to name the activities in the data set
+ 4. Appropriately labels the data set with descriptive variable names. 
+ 5. From the data set in step 4, creates a second, independent tidy data 
    set with the average of each variable for each activity and each subject.


<a name="Procedure"/>
	
## Procedure:
+ 1. Downloading data file and put it in the "`dataset`" folder
+ 2. Assign descriptive variable names 
    For the relevant data loaded into the list of files, 
    there are three categories defined for the data set: Feature, Activity, Subject
+ 3. Read the dataset list of files and assign to variables as data frame.
+ 4. Merges the training and the test sets to create one data set
	a. Merge the data tables by rows (`rbind`)
	b. Set names to variables
	c. Merge columns to get the data frame Data for all data (`cbind`)
+ 5. Extracts only the measurements on the mean and standard deviation for each measurement
 	a. Subset Name of Features by measurements on the mean and standard deviation (mean() or "std()")
+ 6. Uses descriptive activity names to name the activities in the data set
+ 7. Appropriately labels the data set with descriptive variable names.
+ 8. Creates a second, independent tidy data set with the average of each 
    variable for each activity and each subject.
