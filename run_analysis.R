# run_analysis.R
#
# get main datasets and combine into X_data
#
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")

X_data <- rbind(X_test,X_train)

# get features and restrict to measures of 'mean' or 'std'
#
features <- read.table("UCI HAR Dataset/features.txt")
required_features_index <-  features[grep("mean()|std()", features[,2]),]

# Then tidy up the text values which will become column names in the final output
#
required_features_index[,2]=gsub("-", "", required_features_index[,2], fixed=TRUE)
required_features_index[,2]=gsub("()", "", required_features_index[,2], fixed=TRUE)

X_data <- X_data[,required_features_index[,1]]

colnames(X_data) <- required_features_index[,2]

# get subject data 
#
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject <- rbind(subject_test,subject_train)
colnames(subject)[1] <- "subject"

# get activities and translate into meaningful names
#
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
activity <- rbind(y_test,y_train)

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity <- activity_labels[activity[[1]],2]

# Add columns for subject and activity to X_data
#
X_data <- cbind(subject,activity,X_data)

# melt X_data and cast as data.table named melt_data
#
library(data.table)
library(reshape2)
melt_data <- data.table((melt(X_data,id=c("subject","activity"))))

# Average melt_data over (subject,activity)
# Then make column names more informative and order data by subject,activity,feature
#
tidy_data <- melt_data[, list(Average=mean(value)),by = list(subject,activity,feature=variable)]
tidy_data <- tidy_data[order(subject,activity,feature),]

# Finally use write.table to output tidy_data as 'TidyDataProject.txt'
#
write.table(tidy_data,"TidyDataProject.txt", row.names=FALSE)