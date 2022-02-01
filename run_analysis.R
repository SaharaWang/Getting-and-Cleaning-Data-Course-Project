library(tidiverse)

## Merges the training and the test sets to create one dataset
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
download.file(fileUrl, destfile = "./data/project.zip")
list <- unzip("./data/project.zip", exdir = "./data")
train_x <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
test_x <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

train <- cbind(train_subject, train_y, train_x)
test <- cbind(test_subject, test_y, test_x)
df <- rbind(train, test)

## Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("./data/UCI HAR Dataset/features.txt",
                       stringsAsFactors = FALSE)[, 2]
features_num <- grep(("mean\\(\\)|std\\(\\)"), features)
df <- df[, c(1, 2, (features_num+2))]
colnames(df) <- c("subject", "activity", features[features_num])

## Uses descriptive activity names to name the activities in the data set
activityName <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
df$activity <- factor(df$activity, 
                      levels = activityName[, 1], labels = activityName[, 2])

## Appropriately labels the data set with descriptive variable names. 
head(names(df))
names(df) <- gsub("\\()", "", names(df))
names(df) <- gsub("^t", "time", names(df))
names(df) <- gsub("^f", "frequence", names(df))
names(df) <- gsub("-mean", "Mean", names(df))
names(df) <- gsub("-std", "Std", names(df))


## From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
sec <- df %>%
        group_by(subject, activity) %>%
        summarise_each(funs(mean))

write.table(sec, "./tidydata.txt", row.names = FALSE)
