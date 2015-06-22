# CodeBook

This document is a codebook that describes all variables and transformations made to creat a clean and tidy final dataset.

## The Source

Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variables Descriptions

The data 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).


## Columns

* subjectID
* activityt
* BodyAccelerationMean-X
* tBodyAccelerationMean-Y
* tBodyAccelerationMean-Z
* tBodyAccelerationStandardDeviation-X
* tBodyAccelerationStandardDeviation-Y
* tBodyAccelerationStandardDeviation-Z
* tGravityAccelerationMean-X
* tGravityAccelerationMean-Y
* tGravityAccelerationMean-Z
* tGravityAccelerationStandardDeviation-X
* tGravityAccelerationStandardDeviation-Y
* tGravityAccelerationStandardDeviation-Z
* tBodyAccelerationJerkMean-X
* tBodyAccelerationJerkMean-Y
* tBodyAccelerationJerkMean-Z
* tBodyAccelerationJerkStandardDeviation-X
* tBodyAccelerationJerkStandardDeviation-Y
* tBodyAccelerationJerkStandardDeviation-Z
* tBodyGyroMean-X
* tBodyGyroMean-Y
* tBodyGyroMean-Z
* tBodyGyroStandardDeviation-X
* tBodyGyroStandardDeviation-Y
* tBodyGyroStandardDeviation-Z
* tBodyGyroJerkMean-X
* tBodyGyroJerkMean-Y
* tBodyGyroJerkMean-Z
* tBodyGyroJerkStandardDeviation-X
* tBodyGyroJerkStandardDeviation-Y
* tBodyGyroJerkStandardDeviation-Z
* tBodyAccelerationMagnitudeMean
* tBodyAccelerationMagnitudeStandardDeviation
* tGravityAccelerationMagnitudeMean
* tGravityAccelerationMagnitudeStandardDeviation
* tBodyAccelerationJerkMagnitudeMean
* tBodyAccelerationJerkMagnitudeStandardDeviation
* tBodyGyroMagnitudeMean
* tBodyGyroMagnitudeStandardDeviation
* tBodyGyroJerkMagnitudeMean
* tBodyGyroJerkMagnitudeStandardDeviation
* fBodyAccelerationMean-X
* fBodyAccelerationMean-Y
* fBodyAccelerationMean-Z
* fBodyAccelerationStandardDeviation-X
* fBodyAccelerationStandardDeviation-Y
* fBodyAccelerationStandardDeviation-Z
* fBodyAccelerationJerkMean-X
* fBodyAccelerationJerkMean-Y
* fBodyAccelerationJerkMean-Z
* fBodyAccelerationJerkStandardDeviation-X
* fBodyAccelerationJerkStandardDeviation-Y
* fBodyAccelerationJerkStandardDeviation-Z
* fBodyGyroMean-X
* fBodyGyroMean-Y
* fBodyGyroMean-Z
* fBodyGyroStandardDeviation-X
* fBodyGyroStandardDeviation-Y
* fBodyGyroStandardDeviation-Z
* fBodyAccelerationMagnitudeMean
* fBodyAccelerationMagnitudeStandardDeviation
* fBodyBodyAccelerationJerkMagnitudeMean
* fBodyBodyAccelerationJerkMagnitudeStandardDeviation
* fBodyBodyGyroMagnitudeMean
* fBodyBodyGyroMagnitudeStandardDeviation
* fBodyBodyGyroJerkMagnitudeMean
* fBodyBodyGyroJerkMagnitudeStandardDeviation


The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.


## Data cleanup:

The following steps were taken to prepare the data set according to project requirements:
- created one features data set from the training and test sets
  - X_train.txt and X_test.txt were combined
  - subject_train.txt and subject_test.txt were combined
  - y_train.txt and y_test.txt were combined
  - variables were labeled according to features.txt
- extracted mean and standard deviation records for each measurement
  - intermediate data set including variables with labels that contain mean and standard deviation(std) in their names
- assigned descriptive activity names
  - activity values were recoded with descriptive names according to activity_labels.txt
- labeled the data set with descriptive variable names
  - variable names were made more descriptive by using full words and removing dashes and parentheses
- created a second, independent tidy data set with the average of each variable for each activity and each subject
  - final dataset is saved as average_variables.txt
