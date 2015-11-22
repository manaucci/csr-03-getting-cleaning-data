# Subject - Activity Data Analysis

The run_analysis.R scrip will analyze activity data collected from 30 subjects. This activity data was catagoized under the following activities including: 
* standing, 
* sitting, 
* lying down, 
* walking up stairs 
* and walking down stairs. 

The original data sets were divided into two seperate sets of data, i.e., the training data set and the test data sets. In addition, the subject IDs and the activities names were each stored in seperate files

This script will merge the X and Y training and test data sets, the subject data set and the activities data set into one single data set. This dataset will be clean up to meet the tidy data requirments.

The scrip will then persorm summary statistics on this tidy data set to show the averages for each activity per subject. This data set will be stored in a text file called  "activity_means_dataset.txt" in your working directory.

Please note, all of the data files to be read by the sript must be located in the current working directory, same location as this script. 

You must also have the dplyr package avaialble otherwise some of the function calls that rely on this package will fail

