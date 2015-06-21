Human Activity Recognition Using Smartphones
===================

Repo for Getting and Cleaning Data project on Coursera.

# Project Info

The aim of this project is to collect and clean data from ``UCI HAR Dataset.zip``.

# Before you start...

* Script ``run_analysis.R`` should be placed in the same directory as ``UCI HAR Dataset.zip`` archive containg raw data.
* R library ``reshape2`` should be installed on your machine.

# How script works

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Where I can find details?

There are comments in code that describe step by step what script does.

# What can I do?

You can simply run script in R environment by entering command: ``source(run_analysis.R)``.
At the end you will get two data sets in environment:
1. ``final_data`` described by Code Book in ``CodeBook.md`` file.
2. ``tidy_data`` with the same attributes (``CodeBook.md``), but instead of raw values, averages for each activity and each subject are given.
