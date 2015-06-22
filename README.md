##Human Activity Recognition Using Smartphones Dataset Analysis

This readme file is intended to explain the script, not the original data set.

A description of the variables, the data, and the work performed to clean up the data can be found in the CodeBook.md file.

The original data set and a full description of the data is available at the UCI Repository:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The working copy of this data used in this script is located at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script run_analysis.R was created to work with Human Activity Recognition Using Smartphones Dataset [1] and contains all the steps required to transform the data and analyze it as follows:

1. Merge the training and the test sets to create one data set.
2. Extract the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately label the data set with descriptive variable names. 
5. Creates a second data set with the average of each variable for each activity and each subject.

The script assumes you have the data available in your working directory but will, if necessary, download the working data for you.

##Packages Required

You will also need to install the plyr and stringr packages before running the script.

##Source Data and Structure

Human Activity Recognition Using Smartphones Dataset Version 1.0 contains various training and a test files organized and described as follows:

- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/subject_test.txt' : equivalent to 'train/subject_train.txt'

The files uder the train/Inertial Signals/ and test/Inertial Signals/ where not used for this analysis.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
