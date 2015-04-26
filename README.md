# TidyDataProject README

Coursera  getting and cleaning data project

The repo for this project contains these files:

README.md 		(i.e. this file)
run_analysis.R		(R script that produces TidyDataProject.txt from input files)
Codebook.md		(description of variables, data and transforms used)
TidyDataProject.txt	(Tidy data output table)


Each of the files in the original data set (except README.txt and the raw data files) is read into a data.frame of the same name.
The data is then combined into a data.frame named X_data.
For clarity, X_data is then processed via intermediate data structures melt_data and tidy_data.
The end result is output to the file “TidyDataProject.txt”

Hence the algorithm, as documented in run_analysis.R is as follows:

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



The reference for the original data for this project is:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
