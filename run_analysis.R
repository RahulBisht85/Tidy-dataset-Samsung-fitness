## Create a script that does the following.
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data. set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, 
##    independent tidy data set with the average of each variable for each activity and each subject.

## A full description is available at the site where the data was 
## obtained:
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## Here are the data for the project:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 





getwd()
setwd("./Data Science/Assignment")
if (!file.exists("Project")){
    dir.create("./Project")
}
dir()

## The downloaded file is unzipped and saved in "./Project"
url_data <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url_data, "./Project/dataset.zip")

# Unzip dataSet to /data directory
unzip(zipfile="./Project/dataset.zip",exdir="./Project")


list.dirs("./Project")

## save the directory paths in path objects as below
path_main <- list.dirs("./project")[2]
path_test <- list.dirs("./Project")[3]
path_test_inertial <- list.dirs("./Project")[4]
path_train <- list.dirs("./Project")[5]
path_train_inertial <- list.dirs("./Project")[6]

## one can view the dir/files within each dir as below
list.files(path_main)
list.files(path_test)
list.files(path_test_inertial)
list.files(path_train)
list.files(path_train_inertial)

## Reading features.txt into features
features <- read.table(paste0(path_main, "/features.txt"))

## Reading activity_labels.txt from path_main into activity_labels
activity_labels <- read.table(paste0(path_main, "/activity_labels.txt"))

## Reading test files from path_test into subject_test, x_test and  y_test
subject_test <- read.table(paste0(path_test,"/subject_test.txt" ))
x_test <- read.table(paste0(path_test,"/x_test.txt"))
y_test <- read.table(paste0(path_test,"/y_test.txt"))

## Reading train files from path_train into subject_train, x_train and  y_train
subject_train <- read.table(paste0(path_train,"/subject_train.txt"))
x_train <- read.table(paste0(path_train,"/x_train.txt"))
y_train <- read.table(paste0(path_train,"/y_train.txt"))

## copy x_test data into a new test_data object
test_data <- x_test
## combine subject, activity labels and test data in a single data frame (test_all)
test_all <- cbind(subject_test, y_test, test_data)
## name the final data frame columns. feature names are taken from file feature.txt
library(plyr)
names(test_all) <- c("subject", "activity", as.character(features$V2))

## copy x_train data into a new training_data object
training_data <- x_train
## combine subject, activity labels and training data in a single data frame
training_all <- cbind(subject_train, y_train, training_data)
## name the final data frame columns. feature names are taken from file feature.txt
library(plyr)
names(training_all) <- c("subject", "activity", as.character(features$V2))

## merging both test_all and training_all data frames
combined_data <- rbind(test_all, training_all)

## filter the features related to mean and standard deviation.
## filter the names of columns which have only mean() and std(), from the features object.
features_required <- grep("mean\\()|std\\()", features$V2, value = TRUE)
class(features_required)

## select the required columns only in the final data frame
final_data <- combined_data[, c("subject", "activity", features_required)]

## modify the content of "activity" to describe the type of activity in characters.
## define a lookup vector to store activity names in sequence of activity code
lookup_vector <- as.character(activity_labels$V2)
## define a index vector with numeric value of activity code
index = as.numeric(final_data$activity)
## Now change the activity code to activity name by indexing the lookup vector
final_data$activity <- lookup_vector[index]

## Label the dataset variable names with descriptive names and in good format
names_data <- names(final_data)
names_data <- gsub("-", "", names_data)    ## remove all "-"
names_data <- gsub("\\()", "", names_data)   ## remove "()"
names_data <- gsub("^t", "Time", names_data)  ## modify t to time
names_data <- gsub("^f", "Freq", names_data)  ## modify f to Freq
names_data <- sub("subject", "SubjectIdentifier", names_data) ## modify subject
names_data <- sub("activity", "ActivityLabels", names_data) ## modify activity

## rename the final_data dataframe with the descriptive names.
names(final_data) <- names_data


## From the data set in step 4, creates a second, 
## independent tidy data set with the average of each variable 
## for each activity and each subject.

## arrange the final_data in order of subject and activity. 
ordered_data <- arrange(final_data, SubjectIdentifier, ActivityLabels)
library(dplyr)
grouped_data <- group_by(ordered_data, SubjectIdentifier, ActivityLabels)
tidy_data <- summarize_all(grouped_data, funs(mean))

## writing the tidy_data dataset into a text file
write.table(tidy_data, "tidydataset.txt", row.names = FALSE)