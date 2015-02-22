
library(dplyr)

run_analysis <- function()
{

  #read in all data and labels, and features
  train_activity <- read.table("./UCI HAR Dataset/train/Y_train.txt", sep = '\r', header = FALSE)
  train_reading <- read.table("./UCI HAR Dataset/train/X_train.txt", sep = '', header = FALSE)
  train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep = '\r', header = FALSE)
  test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep = '\r', header = FALSE)
  test_activity <- read.table("./UCI HAR Dataset/test/Y_test.txt", sep = '\r', header = FALSE)
  test_reading <- read.table("./UCI HAR Dataset/test/X_test.txt", sep = '', header = FALSE)
  features <- read.table("./UCI HAR Dataset/features.txt", sep = '', header = FALSE)

  #label "group by" columns 
  train_subject <- rename(train_subject, Subject = V1)
  test_subject <- rename(test_subject, Subject = V1)
  train_activity <- rename(train_activity, Activity = V1)
  test_activity <- rename(test_activity, Activity = V1)

  #clean up column names that prevent match from working right and apply those to the HEADERS
  valid_col_names <- make.names(names=names(train_reading), unique=TRUE, allow_ = TRUE)
  names(train_reading) <- valid_col_names
  valid_col_names <- make.names(names=names(test_reading), unique=TRUE, allow_ = TRUE)
  names(test_reading) <- valid_col_names
  names(train_reading) <- features[,2]
  names(test_reading) <- features[,2]
  
  #join the "group by" labels with the data. 
  joined_train <- data.frame(train_subject, train_activity, train_reading)
  joined_test <- data.frame(test_subject, test_activity, test_reading)

  #put both training and test data sets together
  full_df <- rbind(joined_train, joined_test)  
  
  #load the activity labels in place of numbers
  full_df[full_df$Activity==1,2] <- "WALKING"
  full_df[full_df$Activity==2,2] <- "WALKING_UPSTAIRS"
  full_df[full_df$Activity==3,2] <- "WALKING_DOWNSTAIRS"
  full_df[full_df$Activity==4,2] <- "SITTING"
  full_df[full_df$Activity==5,2] <- "STANDING"
  full_df[full_df$Activity==6,2] <- "LAYING"
  
  #grab columns that have mean, std or "group by" columns. Return mean of measurements.  
  short_df <- select(full_df, matches("(Subject|Activity|mean|std)"))
  run_analysis <- short_df %>% group_by(Subject, Activity) %>% summarise_each(funs(mean(., na.rm = TRUE)))

}
