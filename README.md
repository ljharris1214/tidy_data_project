##Readme - Human Activity Recognition Using Smartphones Dataset Analysis

This readme file is a brief overview of the [run_analysis.R](run_analysis.R) script.

For a detailed description of the variables, data and transformations on the source data please see the [CodeBook.md](CodeBook.md) file.

###Script 

The [run_analysis.R](run_analysis.R) script was created to transform and anlyze the Human Activity Recognition Using Smartphones Dataset [1] as follows:

1. Merge the training and the test sets to create one data set.
2. Extract the measurements on the mean and standard deviation for each measurement. 
3. Assign descriptive names to the activities in the data set.
4. Appropriately label the data set with descriptive variable names. 
5. Summarize the data set with the average of each variable for combinations of each activity and subject in the study.

The script assumes that the data is available in your working directory but will, if required, download the working data for you.

##Packages Required

You will also need to install the [stringr](http://cran.r-project.org/web/packages/stringr/index.html) and [plyr](http://cran.r-project.org/web/packages/plyr/index.html) packages before running the script:

###Source Data and Structure

The original data set and a full description of the data is available at the UCI Repository:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The working copy of this data used in this script is located at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The Human Activity Recognition Using Smartphones Dataset contains various training and a test files organized and described as follows:

* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'test/subject_test.txt' : equivalent to 'train/subject_train.txt'

The files uder the *'train/Inertial Signals/'* and *'test/Inertial Signals/'* where not used for this analysis.

###Attribution and Use 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
