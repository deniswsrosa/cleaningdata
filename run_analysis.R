run_analysis <- function() {

## STEP 0: Setting workDir and loading  required packages
library(reshape2)
library(plyr)
setwd('~\\getdata');



## STEP 1: Merges the training and the test sets to create one data set

# reading sources
subject_train <- read.table("train\\subject_train.txt")
X_train <- read.table("train\\X_train.txt")
y_train <- read.table("train\\y_train.txt")

subject_test <- read.table("test\\subject_test.txt")
X_test <- read.table("test\\X_test.txt")
y_test <- read.table("test\\y_test.txt")

# add column name for subject files
names(subject_train) <- "subjectID"
names(subject_test) <- "subjectID"


# add column names for measurement files
featureNames <- read.table("features.txt")
names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2

# add column name for label files
names(y_train) <- "activity"
names(y_test) <- "activity"


# combine files
combined_train <- cbind(subject_train, y_train, X_train)
combined_test <- cbind(subject_test, y_test, X_test)
allcombined <- rbind(combined_train, combined_test)


## STEP 2: Extracts only the measurements on the mean and standard
## deviation for each measurement.

# determine which columns contain "mean()" or "std()"
meanstdcols <- grepl("mean\\(\\)", names(allcombined)) |
  grepl("std\\(\\)", names(allcombined))

# ensure that we also keep the subjectID and activity columns
meanstdcols[1:2] <- TRUE

# remove unnecessary columns
allcombined <- allcombined[, meanstdcols]


## STEP 3: Uses descriptive activity names to name the activities
## in the data set.
## STEP 4: Appropriately labels the data set with descriptive
## activity names. 

# convert the activity column from integer to factor
allcombined$activity <- factor(allcombined$activity, labels=c("WALKING",
                                                        "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

names(allcombined) <- gsub('Acc','Acceleration', names(allcombined))
names(allcombined) <- gsub('Mag','Magnitude', names(allcombined))
names(allcombined) <- gsub('Freq','Frequency', names(allcombined))
names(allcombined) <- gsub('-mean','Mean', names(allcombined))
names(allcombined) <- gsub('-std','StandardDeviation', names(allcombined))
names(allcombined) <- gsub('\\(|\\)','', names(allcombined), perl=TRUE)

## STEP 5:From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# create the tidy data set
melted <- melt(allcombined, id=c("subjectID","activity"))
tidy <- dcast(melted, subjectID+activity ~ variable, mean)

# write the tidy data set to a file
write.csv(tidy, "tidyTrainTest.csv", row.names=FALSE)

}