# Getting-and-Cleaning-Data-Course-Project

## 1.How the Script Works 
First, load the "tidyverse" package because it is needed later.  
  
Second, download and unzip the zip package from the given address. Read the files separately and then merge the training and the test sets to create a single dataset.
  
Then, extract information of measurements from the "features.txt" file and subset measurements on the mean and standard deviation.
  
Afterwards, read from "activity_labels.txt" and replace the numbers in the "activity" column.
  
Rename the colnames of the current dataframe to make sure it is readable.
  
Finally, use the "dplyr" package to group the dataframe and summarise the average of each variable for each activity and each subject.
  
  
## 2.Code Book
list: the files of zip  
train_x: the dataset of X_train.txt  
train_y: the dataset of y_train.txt  
train_subject: the dataset of subject_train.txt  
train: the combined dataframe of the training sets  
test_x: the dataset of X_test.txt  
test_y: the dataset of y_test.txt  
test_subject: the dataset of subject_test.txt  
test: the combined dataframe of the testing sets  
df: the combined dataframe of the training and test sets
  
features: the names of measurements  
features_num: the numbers of columns of targeted measurements  
activityName: descriptive activity names  
  
sec: the second tidy data set
