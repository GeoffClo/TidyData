Files

Input files:

	- 'features_info.txt': Shows information about the variables used on the feature vector.

	- 'features.txt': List of all features.

	- 'activity_labels.txt': Links the class labels with their activity name.

	- 'train/X_train.txt': Training set.

	- 'train/y_train.txt': Training labels.

	- 'train/subject_train.txt': Training subjects.

	- 'test/X_test.txt': Test set.

	- 'test/y_test.txt': Test labels.

	- 'test/subject_test.txt': Test subjects.

Output file:

	- ’Tidydataproject.txt’




Data Structures

###############################################################


subject : 'data.frame':	10299 obs. of  1 variable:
	Combined rows from subject_test and subject_train
 $ subject: int  2 2 2 2 2 2 2 2 2 2 ...


subject_test : 'data.frame':	2947 obs. of  1 variable:
	Input from corresponding file using read.table()
 $ V1: int  2 2 2 2 2 2 2 2 2 2 ...


subject_train : 'data.frame':	7352 obs. of  1 variable:
	Input from corresponding file using read.table()
 $ V1: int  1 1 1 1 1 1 1 1 1 1 ...

###############################################################


activity :  Factor w/ 6 levels "LAYING","SITTING",..: 3 3 3 3 3 3 3 3 3 3 ...
  Result of rbind(y_test,y_train)

activity_labels : 'data.frame':	6 obs. of  2 variables 
	index and string for each activity level
 $ V1: int  1 2 3 4 5 6
 $ V2: Factor w/ 6 levels "LAYING","SITTING",..: 4 6 5 2 3 1


 y_test : 'data.frame':  2947 obs. of  1 variable:
   Input from corresponding file using read.table()
   
 $ V1: int  5 5 5 5 5 5 5 5 5 5 ...
 
 
 y_train : 'data.frame':	7352 obs. of  1 variable:
   Input from corresponding file using read.table()
   
 $ V1: int  5 5 5 5 5 5 5 5 5 5 ...
 
 
###############################################################


features : 'data.frame':	561 obs. of  2 variables:
	Input from corresponding file using read.table()
 $ V1: int  1 2 3 4 5 6 7 8 9 10 ...
 $ V2: Factor w/ 477 levels "angle(X,gravityMean)",..: 243 244 245 250 251 252 237 238 239 240 ...


required_features_index : 'data.frame':	79 obs. of  2 variables:
	Subset of features referring to mean or std
 $ V1: int  1 2 3 4 5 6 41 42 43 44 ...
 $ V2: Factor w/ 477 levels "angle(X,gravityMean)",..: 243 244 245 250 251 252 455 456 457 462 ...



###############################################################

X_test : 'data.frame':	2947 obs. of  561 feature variables:
	Input from corresponding file using read.table()


X_train : 'data.frame':	7352 obs. of  561 feature variables:
	Input from corresponding file using read.table()


X_data : 'data.frame':	10299 obs. of  79 selected feature variables 
	Combined rows from X_test and X_train. 
	Subject and activity columns added in processing
	Feature columns restricted to 79 mean and std variables
 $ subject                        : int  2 2 2 2 2 2 2 2 2 2 ...
 $ activity                       : Factor w/ 6 levels "LAYING","SITTING",..: 3 3 3 3 3 3 3 3 3 3 ...
 $ tBodyAcc-mean()-X              : num  0.257 0.286 0.275 0.27 0.275 ...
  ...
 $ fBodyBodyGyroJerkMag-meanFreq(): num  0.0716 -0.4012 0.0629 0.1167 -0.1217 ...


melt_data : Classes 'data.table' and 'data.frame':	813621 obs. of  4 variables:

	Result of applying melt() to X_data
  
 $ subject : int  2 2 2 2 2 2 2 2 2 2 ...
 
 $ activity: Factor w/ 6 levels "LAYING","SITTING",..: 3 3 3 3 3 3 3 3 3 3 ...
 
 $ variable: Factor w/ 79 levels "tBodyAcc-mean()-X",..: 1 1 1 1 1 1 1 1 1 1 ...
 
 $ value   : num  0.257 0.286 0.275 0.27 0.275 ...


tidy_data : Classes 'data.table' and 'data.frame':	14220 obs. of  4 variables:

	Result of aggregating data in melt_data and tidying up names and sort order
  
	Output to “Tidydataproject.txt”
  
 $ subject : int  1 1 1 1 1 1 1 1 1 1 ...
 
 $ activity: Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
 
 $ variable: Factor w/ 79 levels "tBodyAcc-mean()-X",..: 1 2 3 4 5 6 7 8 9 10 ...
 
 
 $ Average : num  0.2216 -0.0405 -0.1132 -0.9281 -0.8368 ...
 



Algorithm

get main datasets and combine into X_data

get features and restrict to measures of 'mean' or 'std'

Then tidy up the text values which will become column names in the final output

get subject data 

get activities and translate into meaningful names

Add columns for subject and activity to X_data

melt X_data and cast as data.table named melt_data

Average melt_data over (subject,activity)
Then make column names more informative and order data by subject,activity,feature

Finally use write.table to output tidy_data as 'TidyDataProject.txt'
