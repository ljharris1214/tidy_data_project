##Code Book - Human Activity Recognition Using Smartphones Dataset Analysis

This document summarize the variables, data transformations and analysis performed by the run_analysis.R script.

##Conventions

* `train.` and `test.` prefixes are used in variable names to indicate the data split they belong to (train or test data)
* Where appropriate variable postfix names align to the source data conventions.
* For example `test.X` refers to the observations in the test *X_test.txt* data file and `test.y` refers to the labels in the *y_test.txt* file

##Description of the Output Variables

###Variable Naming

* *t* prefix denotes time domain signals captured at a constant rate of 50 Hz
* *f* prefix indicates that a Fast Fourier Transform (FFT) was applied (for a subset of the signals)
* *Acc* in the field indicates accelerometer data
* *Gyro* in the field indicates gyroscope data
* *Body* indicates the body portion of the acceleration signal
* *Gravity* indicates the gravity portion of the acceleration signal
* *Jerk* derived measure based on body linear acceleration and angular velocity derived in time
* *.mean.* in the field indicates that this is an average
* *.std.* in the field indicates that it is the standard deviation
* *.X*, *.Y*, *.Z* in the field denote 3-axial signals in the X, Y and Z directions

*Important:  Please see **features_info.txt** in source data for further details on processing*

The variable meanings are expressed as combination of these components, for example:

* *tBodyAcc.mean.X* is the mean time domain signal for the body portion of the accelerometer X direction
* *tBodyAcc.std.X* is the standard deviation for the previous measure

###Summary of Output Variables

The table below summarizes the Output Variables written out to the file *smartphone_activity_data.txt*


| Field               | Type | Description
|---------------------|------|------------------------------
| split               | char | *test* or *train* to indicate if this is the from the test or train portion of the data set
| subject             | int  | The number Id of the subject in the study (from 1 to 30)
| activity            | char | One of six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
| subject             | int  | The numeric Id of subject in the study from 1 to 30
| tBodyAcc.mean.X     | num  | Mean time domain signal for the body portion of the accelerometer X direction
| tBodyAcc.mean.Y     | num  | Mean time domain signal for the body portion of the accelerometer Y direction
| tBodyAcc.mean.Z     | num  | Mean time domain signal for the body portion of the accelerometer Z direction 
| tBodyAcc.std.X      | num  | 
| tBodyAcc.std.Y      | num  | 
| tBodyAcc.std.Z      | num  | 
| tGravityAcc.mean.X  | num  | **Please read the previous *Variable Naming* section to decode the meaning of these fields**
| tGravityAcc.mean.Y  | num  | 
| tGravityAcc.mean.Z  | num  | 
| tGravityAcc.std.X   | num  | 
| tGravityAcc.std.Y   | num  | 
| tGravityAcc.std.Z   | num  | 
| tBodyAccJerk.mean.X | num  | 
| tBodyAccJerk.mean.Y | num  | 
| tBodyAccJerk.mean.Z | num  | 
| tBodyAccJerk.std.X  | num  | 
| tBodyAccJerk.std.Y  | num  | 
| tBodyAccJerk.std.Z  | num  | 
| tBodyGyro.mean.X    | num  | 
| tBodyGyro.mean.Y    | num  | 
| tBodyGyro.mean.Z    | num  | 
| tBodyGyro.std.X     | num  | 
| tBodyGyro.std.Y     | num  | 
| tBodyGyro.std.Z     | num  | 
| tBodyGyroJerk.mean.X| num  | 
| tBodyGyroJerk.mean.Y| num  | 
| tBodyGyroJerk.mean.Z| num  | 
| tBodyGyroJerk.std.X | num  | 
| tBodyGyroJerk.std.Y | num  | 
| tBodyGyroJerk.std.Z | num  | 
| fBodyAcc.mean.X     | num  | 
| fBodyAcc.mean.Y     | num  | 
| fBodyAcc.mean.Z     | num  | 
| fBodyAcc.std.X      | num  | 
| fBodyAcc.std.Y      | num  | 
| fBodyAcc.std.Z      | num  | 
| fBodyAccJerk.mean.X | num  | 
| fBodyAccJerk.mean.Y | num  | 
| fBodyAccJerk.mean.Z | num  | 
| fBodyAccJerk.std.X  | num  | 
| fBodyAccJerk.std.Y  | num  | 
| fBodyAccJerk.std.Z  | num  | 
| fBodyGyro.mean.X    | num  | 
| fBodyGyro.mean.Y    | num  | 
| fBodyGyro.mean.Z    | num  | 
| fBodyGyro.std.X     | num  | 
| fBodyGyro.std.Y     | num  | 
| fBodyGyro.std.Z     | num  | 

##Transformations

### All Columns and Selected Columns

1. The full list of all 561 columns was read from *features.txt*

2. Open/close parentheses *()* used in the *mean()* and *sum()* portion of features were stripped from the text

3. Commas *,* and dashes *-* were replaced with periods *.*

4. The mean and standard deviation columns were subsetted from the full list of all columns by matching of the *..mean..* and *..std..* substrings yielding 48 columns to be included selected for output

### Observations (X)

1. All lines from *X_test.txt* (2,947 lines) and *X_train.txt* (7,352 lines) where read using `readLines`

2. Leading and trailing whitespace where trimmed from each line

3. Contiguos sequences of one or more whitespace characters were replaced by a comma *,* separator

4. The cleaned lines where read into `test.X` and `train.X` data frames and subsetted to include only the 48 mean and std columns 

### Labels (y)

1. The reference list of id and text labels for activities where read from *activity_labels.txt* into `activities`

2. All lines from *y_test.txt* (2,947 lines) and *y_train.txt* (7,352 lines) where read into `test.y` and `train.y` respectively

3. Numeric values in `test.y` and `train.y` where matched against `activities` and numeric values where replaceds with text labels 

### Subjects

All lines from *subject_test.txt* (2,947 lines) and *subject_train.txt* (7,352 lines) where read into `test.subject` and `train.subject` respectively

### Test and Train Data Merging

1. `test.data` and `train.data` data frames were constructed by binding column from earlier steps:

* split  (literal value of "test" or "train")
* subject (`test.subject` and `train.subject`)
* activity (`test.y` and `train.y`)
* training (`test.X` and `train.X`)

2. `test.data` and `train.data` where row bound to a final `merged.data` that containes 10,299 observations and 51 variables

### Export

`merged.data` data frame was exported to a file *smartphone_activity_data.txt* 

##Analysis

An second data set, *smartphone_activity_summary.txt*, summarizes all measures accelerometer and gyroscope measurements by computing the mean for each combination of subject and activity


