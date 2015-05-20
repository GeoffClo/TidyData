
# packages required: dplyr and tidyr

# Files

	- 'features_info.txt': Shows information about the variables used on the feature vector.
	- 'features.txt': List of all features.
	- 'activity_labels.txt': Links the class labels with their activity name.
	- 'train/X_train.txt': Training set.
	- 'train/y_train.txt': Training labels.
	- 'train/subject_train.txt': Training subjects.
	- 'test/X_test.txt': Test set.
	- 'test/y_test.txt': Test labels.
	- 'test/subject_test.txt': Test subjects.

	- ’Tidydataproject.txt’: Final result

# Data Structures

subject : 'data.frame':	10299 obs. of  1 variable:
	Combined rows from subject_test and subject_train

subject_test : 'data.frame':	2947 obs. of  1 variable:
	Input from corresponding file using read.table()

subject_train : 'data.frame':	7352 obs. of  1 variable:
	Input from corresponding file using read.table()

activity :  Factor w/ 6 levels "LAYING","SITTING",..: 3 3 3 3 3 3 3 3 3 3 ...
  Result of rbind(y_test,y_train)

activity_labels : 'data.frame':	6 obs. of  2 variables 
	index and string for each activity level

 y_test : 'data.frame':  2947 obs. of  1 variable:
   Input from corresponding file using read.table()
 
 y_train : 'data.frame':	7352 obs. of  1 variable:
   Input from corresponding file using read.table()

features : 'data.frame':	561 obs. of  2 variables:
	Input from corresponding file using read.table()

required_features_index : 'data.frame':	79 obs. of  2 variables:
	Subset of features referring to mean or std

X_test : 'data.frame':	2947 obs. of  561 feature variables:
	Input from corresponding file using read.table()

X_train : 'data.frame':	7352 obs. of  561 feature variables:
	Input from corresponding file using read.table()

X_data : 'data.frame':	10299 obs. of  subject, activity and 79 selected feature variables 
	Combined rows from X_test and X_train. 
	Subject and activity columns added in processing
	Feature columns restricted to 79 mean and std variables

wide_data : 'data.frame':	180 obs. of  81 variables:
	Result of averaging features in X_data and tidying up names and sort order
  
long_data : 'data.frame':  14220 obs. of  4 variables:
	Output to “Tidydataproject.txt”
 

# Algorithm

get main datasets and combine into X_data

get features and restrict to measures of 'mean' or 'std'
Then tidy up the text values which will become column names in the final output

get subject data 
get activities and translate into meaningful names
Add columns for subject and activity to X_data

Average feature measurements over (subject,activity)
Then make column names more informative, create long format and order data by subject,activity,feature
Finally use write.table to output long_data as 'TidyDataProject.txt'
