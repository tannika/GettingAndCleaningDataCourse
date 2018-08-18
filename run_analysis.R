##Reads and process data set

library(plyr)

##STEP 1: Merges the training and the test sets to create one data set.

## Read the text files
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")  
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

##Assign column names
colnames(X_test) <- features[,2]
colnames(X_train) <- features[,2]
colnames(y_test) <- "activity"
colnames(y_train) <- "activity"
colnames(subject_test) <- "sub"
colnames(subject_train) <- "sub"

##Bind train data
train <- cbind(subject_train,X_train,y_train)

##Bind test data
test <- cbind(subject_test,X_test,y_test)

##Create a final data set
finalDataSet <- rbind(train,test)

##STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement.

meanDataSet <-finalDataSet[,grepl("mean|std",colnames(finalDataSet))]

##STEP 3:Uses descriptive activity names to name the activities in the data set

names(activity_labels)<-c("activity","activityName")
finalDataSet<- join(finalDataSet, activity_labels, by = "activity", match = "first")
finalDataSet<-finalDataSet[,-1]

##STEP 4: Appropriately labels the data set with descriptive variable names.

##Remove () from all column names
names(finalDataSet) <- gsub("\\(|\\)", "", names(finalDataSet))

##STEP 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidyDataSet<- ddply(finalDataSet, c("sub","activityName"), numcolwise(mean))
write.table(tidyDataSet,file="tidyDataSet.txt")