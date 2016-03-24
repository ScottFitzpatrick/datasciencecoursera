# Coursera - John Hopkins University - Getting and Cleaning Data - Course Project
# information below is modified version of select files from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# this README file intends to explain the run_analysis.R script that was used to gather and tidy data from the dataset found above

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'CodeBook.md' for more details. 

Two data sets result from run_analysis.R which are subsets of original data set:
======================================
fulldataset
- fulldataset gathers all records from the 'test' data set and the 'train' data set and merges them into one
- this data set subsets only the variables related to mean and standard deviation
- the data set attempts to name the columns and activities to make it a bit easier to follow

tidydataset
- tidydataset groups the fulldataset described above by both subject (1-30) and activity (1-6)
- this data set then calculates the average measurement value of both means and standard deviations for each of the 30 subjects during each of the 6 activities
- the data set attempts to tidy the fulldataset by gathering variable names into rows rather than columns, separating out those variables which have a direction (X, Y, or Z) component, and spreading the 'avgmean' and 'avgstd' measurements to their own columns
======================================

Notes: 
======

The accompanying CodeBook.md file sketches out the variables included in these tables
=========================================


License: [from the original authors]
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
