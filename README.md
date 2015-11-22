## The Subject's Activity Data Analysis Script


The run_analysis.R scrip will analyze activity data collected from 30 subjects. The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The original data sets were divided into two seperate sets of data, i.e., the training data set and the test data sets. In addition, the subject IDs and the activities names were each stored in seperate files

This script will merge the X and Y training and test data sets, the subject data set and the activities data set into one single data set. This dataset will be clean up to meet the tidy data requirments.

The scrip will then persorm summary statistics on this tidy data set to show the averages for each activity per subject. This data set will be stored in a text file called  "activity_means_dataset.txt" in your working directory.

Please note, all of the data files to be read by the sript must be located in the current working directory, same location as this script. 

You must also have the dplyr package avaialble otherwise some of the function calls that rely on this package will fail

