# TidyDataProject README

	Coursera  getting and cleaning data project

## The repo for this project contains these files:

README.md 		(i.e. this file)   
run_analysis.R		(R script that produces TidyDataProject.txt from input files)   
Codebook.md		(description of variables, data and transforms used)   
TidyDataProject.txt	(Tidy data output table)   

Each of the files in the original data set (except README.txt and the raw data files) is read into a data.frame of the same name.  
The data is then combined into a data.frame named X_data.  
X_data is then averaged and processed into wide and long data formats.  
The long format is chosen to output to the file “TidyDataProject.txt”  

Hence the algorithm, as documented in Codebook.md is as follows:

>get main datasets and combine into X_data

>get features and restrict to measures of 'mean' or 'std'
>Then tidy up the text values which will become column names in the final output

>get subject data 
>get activities and translate into meaningful names
>Add columns for subject and activity to X_data

>Average feature measurements over (subject,activity)
>Then make column names more informative, create long format and order data by subject,activity,feature
>Finally use write.table to output long_data as 'TidyDataProject.txt'


The reference for the original data for this project is:  

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
