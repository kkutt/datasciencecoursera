############ Step 1 ############
message("Step 1. Merge the training and the test sets to create one data set.")

# unzip data
message("Step 1a. Unzipping data...")
unzip("UCI HAR Dataset.zip")

# load RAW files
message("Step 1b. Loading train data...")
X_train <- read.table(file = "UCI HAR Dataset/train/X_train.txt")
y_train <- read.table(file = "UCI HAR Dataset/train/y_train.txt")
s_train <- read.table(file = "UCI HAR Dataset/train/subject_train.txt")

message("Step 1c. Loading test data...")
X_test <- read.table(file = "UCI HAR Dataset/test/X_test.txt")
y_test <- read.table(file = "UCI HAR Dataset/test/y_test.txt")
s_test <- read.table(file = "UCI HAR Dataset/test/subject_test.txt")

message("Step 1d. Merging data...")
features <- read.table(file = "UCI HAR Dataset/features.txt")

# change colnames
colnames(X_train) <- features$V2
colnames(y_train) <- "Activity"
colnames(s_train) <- "Subject"

colnames(X_test) <- features$V2
colnames(y_test) <- "Activity"
colnames(s_test) <- "Subject"

# bind RAW files to train and test sets (different RAW files represent different attributes of observation -> use column bind)
train <- cbind(s_train, y_train, X_train)
test <- cbind(s_test, y_test, X_test)

# bind train and test sets into one data set (train and test sets are different observations of the same values -> use row bind)
data_set <- rbind(train, test)


############ Step 2 ############
message("Step 2. Extract only the measurements on the mean and standard deviation for each measurement.")
data_extracted <- data_set[,grepl("mean|std|Activity|Subject", colnames(data_set))]


############ Step 3 ############
message("Step 3. Use descriptive activity names to name the activities in the data set.")

# read activities names
activities <- read.table(file = "UCI HAR Dataset/activity_labels.txt")
colnames(activities)[2] <- "Activity_Name"

# add activities names to data set
final_data <- merge(x = data_extracted, y = activities, by.x = "Activity", by.y = "V1")

# rearrange columns
final_data <- final_data[,c(1,82,2:81)]


############ Step 4 ############
# already done in step 2
message("Step 4. Appropriately label the data set with descriptive variable names.")


############ Step 5 ############
message("Step 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.")

library(reshape2)

# melt data
IDs_cols = c("Activity", "Activity_Name", "Subject")
other_cols = setdiff(colnames(final_data), IDs_cols)
melted_data <- melt(final_data, id=IDs_cols, measure.vars=other_cols)
    
# recast 
tidy_data <- dcast(melted_data, Activity + Activity_Name + Subject ~ variable, mean)    

# remove needless sets
rm(X_train, y_train, s_train, X_test, y_test, s_test, features, train, test, data_set, data_extracted, activities, IDs_cols, other_cols, melted_data)


message("That's all folks!")

