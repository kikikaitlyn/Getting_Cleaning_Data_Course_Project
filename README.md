# Getting_Cleaning_Data_Course_Project
This is assignment repo for Getting_Cleaning_Data_Course from Coursera

To rerun this file, make sure to put the zip data in your current directory.
#######################
##    raw data     ####
#######################

You will find the code which can answer the 5 step asked :
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


##############################
##    project purpose     ####
##############################

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

The code and comments are part of the run_analysis.R file, line by line.

The goal of the task was to combine the subject_test, experiment participant in this case, with the activity, and the time or frequency data gathered from the smartphone. The smartphone collected X, Y, and Z coordinates of the participants' movements. Next,
I integrated and presented only the mean and standarard deviation of the X, Y, and Z components of the time and frequency data, merging them. This analysis includes mean and standard deviation and omits many of the other variables such as mad, min, max, energy, iqr, entropy, and so on. Whereas the original data contained 561 factor level variables, this analysis contains 180 observations.

The file run_analysis.R is created following several steps:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
