# The data analize the activity data collected from the 30 subjects. the activity data includes, standing, sitting, lying down, walking up stairs and walking down stairs
# This script will merge the X and Y training and test data sets, cleaning up data to provide a tidy data set.
# The scrip will then persorm summary statistics on the tidy data set to produce averages for each activity per subject 
# Please note, all of the data files to be read by the sript must be located in the current working directory as this script

#start by loading the dplyr library, otherwise some of the function calls will fail
 library("dplyr")

# Read in the trainig data sets
 traindata <- read.table("X_train.txt")
 trainactivity <- read.table("y_train.txt")

 # Read in the test data sets
 testdata <- read.table("X_test.txt")
 testactivity <- read.table("y_test.txt")
#Read in the Subjects  data sets
 trainsubject <- read.table("subject_train.txt")
 testsubject <- read.table("subject_test.txt")

# Combine the columns test data sets
 testdata2 <- cbind(testactivity, testdata)
 testdata3 <- cbind(testsubject, testdata2)

# Combine the columns training data sets
 traindata2 <- cbind(trainactivity, traindata)
 traindata3 <- cbind(trainsubject, traindata2)
 
# Now you need to combine these two data sets into one
 sampledata <- rbind(testdata3, traindata3)

# rename the subject and the activity columns
 names(sampledata)[1:2] <- c("subject", "activity") 

# get the features data - this is the data I will need to eventually use to label dthe columns
 featuresdata <- read.table("features.txt")
# Get the list of column names in a vector
 featuresnameslist <- featuresdata$V2d
# add the first two columns names
 featuresnameslist <- c("subject", "activity", as.character(featuresdata$V2))
 names(sampledata) <- c(featuresnameslist)

# from the features list, get the indexs where the data matches mean or std
 variableslist <- grep("mean|std", featuresnameslist)

# data set wiht the means and std columns and remember to add back the subject and activity data
 cleansampledata <- sampledata[,c(1,2,variableslist)]

# now to add the activity labels to the rows
 activity_label <- read.table("activity_labels.txt")
 cleansampledata <- mutate(cleansampledata, subject_activity=activity_label[activity,2])

# rearrange the columns to bring the activity to the front
 cleansampledata <- cleansampledata[,c(82, 1:81)]
#rename the columsn
# reorder by subject
 tidydataset <- arrange(tidydataset, subject)
 
# create factors by grouping by subject AND subject activity
 subjectgroup <- group_by(tidydataset, subject, subject_activity)
# Now get the means for each variable amd save the result in the completeddataset variable
# (note, there is probaly a more efficent way to do this then to explicitly name each variable but this works for now)
completeddataset <- summarise(subjectgroup, 
`tBodyAcc-mean()-X`=mean(`tBodyAcc-mean()-X`), 
`tBodyAcc-mean()-Y`=mean(`tBodyAcc-mean()-Y`), 
`tBodyAcc-mean()-Z`=mean(`tBodyAcc-mean()-Z`), 
`tBodyAcc-std()-X`=mean(`tBodyAcc-std()-X`), 
`tBodyAcc-std()-Y`=mean(`tBodyAcc-std()-Y`), 
`tBodyAcc-std()-Z`=mean(`tBodyAcc-std()-Z`), 
`tGravityAcc-mean()-X`=mean(`tGravityAcc-mean()-X`), 
`tGravityAcc-mean()-Y`=mean(`tGravityAcc-mean()-Y`), 
`tGravityAcc-mean()-Z`=mean(`tGravityAcc-mean()-Z`), 
`tGravityAcc-std()-X`=mean(`tGravityAcc-std()-X`), 
`tGravityAcc-std()-Y`=mean(`tGravityAcc-std()-Y`), 
`tGravityAcc-std()-Z`=mean(`tGravityAcc-std()-Z`), 
`tBodyAccJerk-mean()-X`=mean(`tBodyAccJerk-mean()-X`), 
`tBodyAccJerk-mean()-Y`=mean(`tBodyAccJerk-mean()-Y`), 
`tBodyAccJerk-mean()-Z`=mean(`tBodyAccJerk-mean()-Z`), 
`tBodyAccJerk-std()-X`=mean(`tBodyAccJerk-std()-X`), 
`tBodyAccJerk-std()-Y`=mean(`tBodyAccJerk-std()-Y`), 
`tBodyAccJerk-std()-Z`=mean(`tBodyAccJerk-std()-Z`), 
`tBodyGyro-mean()-X`=mean(`tBodyGyro-mean()-X`), 
`tBodyGyro-mean()-Y`=mean(`tBodyGyro-mean()-Y`), 
`tBodyGyro-mean()-Z`=mean(`tBodyGyro-mean()-Z`), 
`tBodyGyro-std()-X`=mean(`tBodyGyro-std()-X`), 
`tBodyGyro-std()-Y`=mean(`tBodyGyro-std()-Y`), 
`tBodyGyro-std()-Z`=mean(`tBodyGyro-std()-Z`), 
`tBodyGyroJerk-mean()-X`=mean(`tBodyGyroJerk-mean()-X`), 
`tBodyGyroJerk-mean()-Y`=mean(`tBodyGyroJerk-mean()-Y`), 
`tBodyGyroJerk-mean()-Z`=mean(`tBodyGyroJerk-mean()-Z`), 
`tBodyGyroJerk-std()-X`=mean(`tBodyGyroJerk-std()-X`), 
`tBodyGyroJerk-std()-Y`=mean(`tBodyGyroJerk-std()-Y`), 
`tBodyGyroJerk-std()-Z`=mean(`tBodyGyroJerk-std()-Z`), 
`tBodyAccMag-mean()`=mean(`tBodyAccMag-mean()`), 
`tBodyAccMag-std()`=mean(`tBodyAccMag-std()`), 
`tGravityAccMag-mean()`=mean(`tGravityAccMag-mean()`), 
`tGravityAccMag-std()`=mean(`tGravityAccMag-std()`), 
`tBodyAccJerkMag-mean()`=mean(`tBodyAccJerkMag-mean()`), 
`tBodyAccJerkMag-std()`=mean(`tBodyAccJerkMag-std()`), 
`tBodyGyroMag-mean()`=mean(`tBodyGyroMag-mean()`), 
`tBodyGyroMag-std()`=mean(`tBodyGyroMag-std()`), 
`tBodyGyroJerkMag-mean()`=mean(`tBodyGyroJerkMag-mean()`), 
`tBodyGyroJerkMag-std()`=mean(`tBodyGyroJerkMag-std()`), 
`fBodyAcc-mean()-X`=mean(`fBodyAcc-mean()-X`), 
`fBodyAcc-mean()-Y`=mean(`fBodyAcc-mean()-Y`), 
`fBodyAcc-mean()-Z`=mean(`fBodyAcc-mean()-Z`), 
`fBodyAcc-std()-X`=mean(`fBodyAcc-std()-X`), 
`fBodyAcc-std()-Y`=mean(`fBodyAcc-std()-Y`), 
`fBodyAcc-std()-Z`=mean(`fBodyAcc-std()-Z`), 
`fBodyAcc-meanFreq()-X`=mean(`fBodyAcc-meanFreq()-X`), 
`fBodyAcc-meanFreq()-Y`=mean(`fBodyAcc-meanFreq()-Y`), 
`fBodyAcc-meanFreq()-Z`=mean(`fBodyAcc-meanFreq()-Z`), 
`fBodyAccJerk-mean()-X`=mean(`fBodyAccJerk-mean()-X`), 
`fBodyAccJerk-mean()-Y`=mean(`fBodyAccJerk-mean()-Y`), 
`fBodyAccJerk-mean()-Z`=mean(`fBodyAccJerk-mean()-Z`), 
`fBodyAccJerk-std()-X`=mean(`fBodyAccJerk-std()-X`), 
`fBodyAccJerk-std()-Y`=mean(`fBodyAccJerk-std()-Y`), 
`fBodyAccJerk-std()-Z`=mean(`fBodyAccJerk-std()-Z`), 
`fBodyAccJerk-meanFreq()-X`=mean(`fBodyAccJerk-meanFreq()-X`), 
`fBodyAccJerk-meanFreq()-Y`=mean(`fBodyAccJerk-meanFreq()-Y`), 
`fBodyAccJerk-meanFreq()-Z`=mean(`fBodyAccJerk-meanFreq()-Z`), 
`fBodyGyro-mean()-X`=mean(`fBodyGyro-mean()-X`), 
`fBodyGyro-mean()-Y`=mean(`fBodyGyro-mean()-Y`), 
`fBodyGyro-mean()-Z`=mean(`fBodyGyro-mean()-Z`), 
`fBodyGyro-std()-X`=mean(`fBodyGyro-std()-X`), 
`fBodyGyro-std()-Y`=mean(`fBodyGyro-std()-Y`), 
`fBodyGyro-std()-Z`=mean(`fBodyGyro-std()-Z`), 
`fBodyGyro-meanFreq()-X`=mean(`fBodyGyro-meanFreq()-X`), 
`fBodyGyro-meanFreq()-Y`=mean(`fBodyGyro-meanFreq()-Y`), 
`fBodyGyro-meanFreq()-Z`=mean(`fBodyGyro-meanFreq()-Z`))

# Finally, save the completed activity means dataset into a text file
write.table(completeddataset, file = "activity_means_dataset.txt", row.names = FALSE)
