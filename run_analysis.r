library(plyr)

# -------------------------------------------------------------------
# 1. Merges the training and the test sets to create one data set
# -------------------------------------------------------------------

#Read training data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

#Read test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

#create combined x_data from train and test
all_x_data <- rbind(x_train, x_test)

#create combined y_data set from train and test
all_y_data <- rbind(y_train, y_test)

#create subject_data from subject_train and subject_test
all_subject_data <- rbind(subject_train, subject_test)


# ----------------------------------------------------------------------------------------
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# ----------------------------------------------------------------------------------------

# create features data for column names
features <- read.table("UCI HAR dataset/features.txt")

#pull columns containing "mean" OR "std" in column names
mean_and_std <- grep("-(mean|std)\\(\\)", features[, 2])

# get just the data you need for mean_and_std (66 cols)
all_x_data <- all_x_data[, mean_and_std]

# ----------------------------------------------------------------------------------------
# 3. Uses descriptive activity names to name the activities in the data set.
# ----------------------------------------------------------------------------------------

# get activity labels
activities <- read.table("UCI HAR dataset/activity_labels.txt")

# fix activity names
all_y_data[, 1] <- activities[all_y_data[, 1], 2]


# ----------------------------------------------------------------------------------------
# 4. Appropriately labels the data set with descriptive variable names
# ----------------------------------------------------------------------------------------
names(all_x_data) <- features[mean_and_std, 2]
names(all_y_data) <- "activity"
names(all_subject_data) <- "subject"

# ----------------------------------------------------------------------------------------
# 5. From the data set in step 4, creates a second, independent tidy data set with the
#    average of each variable for each activity and each subject
# ----------------------------------------------------------------------------------------

# Combine the three data sets
all_data <- cbind(all_x_data, all_y_data, all_subject_data)

# average first 66 columns of all_data split by subject, activity using colMeans
averages <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

# write out averages to file
write.csv(averages, "UCI HAR dataset/averages.csv",row.names = FALSE)
