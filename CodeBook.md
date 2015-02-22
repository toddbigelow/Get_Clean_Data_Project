###Codebook

## Scripts

This work utilizes one R script, "run_analysis.r", which performs the tasks listed below in Transformations.  

## Variables

Subject - number between 1 and 30 representing the individual under observation at the time the data in the other columns were taken.  

Activity - description of the action being performed by the subject when each of the remaining variables were measured. These include: 'WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', and 'LAYING'.

The remaining variables are listed in "features_tidy.txt", and the original variables and signals from the original authors can be found in feature_inf.txt.  

##Transformations

1) The training data and test data were read in from the original files, with 'X_train.txt' containing the actual measurements, 'Y_train.txt' containing the activity code, and 'subject_train' containing the subject number matching the measurement.  The same was done for the test data set.  Thwe feature list was read in for later use. 

2) The column names for the signal variables were cleaned up, removing characters that prevent proper matching.  

3) The feature list was written to the signal measurement data table column names. The subject and activity column names were labeled appropriately.  

4) All data tables (subject, activity, and measurement) were joined for both training and test such that both sets contained the same set of columns. 

5) Training and test data were combined together by row.  

6) The activity codes were replaced by meaningful descriptors (see activity_labels.txt"

7) Only columns of interest were selected (subject, activity, and mean or std columns.  

8) The mean of each measurement column was calculated, grouping the data by subject and activity using 'group_by' and 'summarise_each'.

9) The data was written using write.table() with row.name = FALSE.


