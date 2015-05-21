# CourseraGettingAndCleaningData
Coursera Getting and Cleaning data course project repository.

The goal of this project is to create a clean dataset from data 
collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained from.

The run_analysis.R R script contains the R code that does the following:

Reads and merges the training and testing datasets.
Sets the names for features as described in features.txt.
Extracts the variables describing mean and standard deviation.
Replaces activity ids with proper names as described in activity_labels.txt
Reshapes the data to create a dataset with the average of each variable for each activity and each subject.
Writes this dataset into tidyData.txt file.

tidyData.txt contains a dataset that os further described in codebook.md.

Important: the script assumes that the downloaded data is run in the unzipped folder "UCI HAR Dataset"
that resides at the same leel as the run_analysis.R script.

