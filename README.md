# GettingAndCleaningDataCourse
Getting And Cleaning Data Course

This repo consists of 2 files - 
1. CodeBook.md - Data to indicate all the variables and summaries calculated and any other relevant information.
2. Run_analysis.R - This contains the code to clean the data set as per the problem statements. Text files will be picked up from the given directories and should be downloaded before running run_analysis.R. The final data set will be stored in the working directory.

The script peforms the following steps on human activities - 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The tidyDataSet.txt stored in the working dir was created using run_analysis.R. This file would require dplyr which is automatically installed through the file.
