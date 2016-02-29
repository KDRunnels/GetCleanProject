##Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Attribute Information:

* For each record in the dataset it is provided: 
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
*  Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

##Data Files

* features_info.txt -  Information on variables used in features

* features.txt - List of all features

* activity_labels.txt -Xref of class labels with their activity

* train\X_train.txt - Training data

* train\y_train.txt - Training data labels

* test\X_test.txt - Test data

* test\y_test.txt - Test data labels

##Tranformations
* Merge the training and test sets into one data set
* Extract only measurements related to mean and standard deviation for each measurement
* Apply descriptive activity names to name the activities in the data set
* Appropriately label the dta set with descriptive variable names
* From the combined data set, create a second, independent tidy data set with the average of each vriable for each activity and each subject.

###Please see Readme.md for step by step description of run_analysis.r



