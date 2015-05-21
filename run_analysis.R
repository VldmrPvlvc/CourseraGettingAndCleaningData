## This script has to run one folder level above the "UCI HAR Dataset" folder
## Load training data. This requires that all the data is compied into the folder from which this script is running.
trainX <- read.table("./UCI\ HAR\ Dataset/train/X_train.txt")
trainY <- read.table("./UCI\ HAR\ Dataset/train/Y_train.txt", col.names='Activity.Id')
trainSubject <- read.table("./UCI\ HAR\ Dataset/train//subject_train.txt", col.names='Subject.Id')

## Load test data.
testX <- read.table("./UCI\ HAR\ Dataset/test/X_test.txt")
testY <- read.table("./UCI\ HAR\ Dataset/test/Y_test.txt", col.names='Activity.Id')
testSubject <- read.table("./UCI\ HAR\ Dataset/test/subject_test.txt", col.names='Subject.Id')

## Merges the training and the test sets to create one data set.
trainTestX <- rbind( trainX, testX)
trainTestY <- rbind( trainY, testY)
trainTestSubject <- rbind( trainSubject, testSubject)

## Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table('./UCI\ HAR\ Dataset/features.txt', col.names=c('Feature.Id', 'Feature.Name'))
names(testX) <- features$Feature.Name
col_idx <- grep("-(mean|std)\\(\\)-", features$Feature.Name)
meanStdX <- trainTestX[, col_idx]

## Uses descriptive activity names to name the activities in the data set
activities <- read.table('./UCI\ HAR\ Dataset/activity_labels.txt', col.names=c('Activity.Id', 'Activity'))
trainTestActivityY <- merge(trainTestY, activities)
trainTestActivityY$Activity.Id <- NULL

## Appropriately labels the data set with descriptive variable names. 

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for 
## each activity and each subject.

library(reshape2)

tidyData <- cbind(trainTestSubject, trainTestActivityY, meanStdX)
tidyDataAvg <- dcast(melt(tidyData, id.vars=c('Subject.Id', 'Activity')),
                     Subject.Id + Activity ~ variable,
                     mean)
setwd('..')
write.table(tidyDataAvg, file='tidyData.txt', row.names=F)

