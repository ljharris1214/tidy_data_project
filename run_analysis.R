rm(list = ls()) # clear workspace

# required packages
# library(sqldf)
# library(plyr)
library(stringr)

# ..............................................................................
# Get source data if it does not exist
# ..............................................................................

source.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
source.zip <- "getdata-projectfiles-UCI HAR Dataset.zip"
source.baseDir <- "UCI HAR Dataset"
if(!file.exists(source.zip))
{
  download.file(url = source.url, destfile = source.zip, mode = "wb")
  unzip(source.zip)
}

# ..............................................................................
# Load and clean the test/train observations (X)
# ..............................................................................
readAndClean.X <- function (filePath, allCols, selectCols)
{
  l <- readLines(filePath)
  l <- str_trim(l, side = "both") # trim leading/trailing whitespace
  l <- str_replace_all(l, "\\s+", ",") # replace whitespace sequences with ","
  subset(read.table(text = l, sep = ",", col.names = allCols), select = selectCols)
}

# Load and normalize column names for X
cols.X.all <- read.delim("UCI HAR Dataset/features.txt", sep = " ", header = F, stringsAsFactors = F)[,2]
cols.X.all <- str_replace_all(cols.X.all, "\\(\\)", "") # remove func parenths
cols.X.all <- str_replace_all(cols.X.all, ",|-", ".") # replace dashes and commas
# mean and standard deviation subset, mean(): Mean value, std(): Standard deviation
cols.X.select <- cols.X.all[str_detect(cols.X.all, "\\.std\\.|\\.mean\\.")]

# read and transform observations
test.X <- readAndClean.X("UCI HAR Dataset/test/X_test.txt", cols.X.all, cols.X.select)
train.X <- readAndClean.X("UCI HAR Dataset/train/X_train.txt", cols.X.all, cols.X.select)

# ..............................................................................
# Load and factorize the labels (y)
# ..............................................................................
activities = read.delim("UCI HAR Dataset/activity_labels.txt", sep = " ",
                        header = F,stringsAsFactors = F)[,2]
test.y <- read.delim("UCI HAR Dataset/test/y_test.txt", header = F)[,1]
train.y <- read.delim("UCI HAR Dataset/train/y_train.txt", header = F)[,1]


# ..............................................................................
# Combine observations (X) w/ labels (y) the concatenate train and test sets
# ..............................................................................


activity <- test.y
split <- rep("test", each = nrow(test.X))
test.data <- cbind(split, activity,test.X)
test.data$activity <- factor(test.data$activity, activities)
#test.data$data.split <- rep("test", each = nrow(test.X))
#rm(test.X, test.y) # free up some memory

activity <- train.y
split <- rep("train", each = nrow(train.X))
train.data <- cbind(split, activity,train.X)
train.data$activity <- factor(train.data$activity, activities)
#rm(train.X, train.y) # free up some memory

merged.data <- rbind(test.data,train.data)
#rm(test.data,train.data) # free up some memory

write.table(merged.data, file = "smartphone_activity_data.csv", 
            sep = ",", row.names = F)

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.





