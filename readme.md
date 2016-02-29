#Getting and Cleaning Data Project
This documents constitues the description of the processing done by the "run_analysis.R" file. A description of the original data can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  The actual data used is in the zip file found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

##Environment:
The working directory is an empty directory containing the folder that is extracted from the zip file that contains the data.  The default folder name from the zip file is "UCI HAR dataset".  The run_analysis script expects the default zip file structure and files.  The script presumes that plyr has been installed.

##run_analysis.R
The script is ordered into the steps that were given in the assignment and are as follows:

**1. Merges the training and the test sets to create one data set**

   1. This section reads the training data (X\_train.txt, y\_train.txt, and subject\_train.txt) from the *train* directory.
   2. The X\_test.txt, y\_test.txt, and subject_test.txt files are also read in from the *test* directory.
   3. The r\_bind function is then used to merge x\_train and x\_test into all_x_data.
   4. The r\_bind funciton is again used to merge y\_train and y\_test into all\_y\_data.
   5. Lastly, r\_bind is used to merge subject\_train and subject\_test into all\_subject\_data. 

**2. Extracts only the measurements on the mean and standard deviation for each measurement.**

   1. Read in the features.txt data
   2. Grep the features data to identify only "std" and "mean" names
   3. Subset all\_x\_data to only include the data from the "std" and "mean" sets.  

**3. Uses descriptive activity names to name the activities in the data set.**

   1. Read in the activity labels
   2. Update all\_y\_data to add activity labels as factors  

**4. Appropriately labels the data set with descriptive variable names**

   1. Updates all\_x\_data variables with the features data for "std" and "mean"
   2. Name v1 "activity" for all\_y\_data
   3. Name v1 "subject" for all\_subject\_data  

**5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject**
  
   1. Combine the three data sets (all\_x\_data, all\_y\_data, and all\_subject\_data.
   2. Use ddply on the combined data to run colMeans on the first 66 columns (excl. "subject" and "activity"), split by subject and activity
   3. Write out averages to the file "averages.csv"






