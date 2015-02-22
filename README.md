### Introduction

The code in this repository reads data from the link below and summarizes selections of the original authors' measurements into a tidy data set ('tidy_wearable_data.txt'). 

'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

To access the tidy data please use this command in R:

'dt <- read.table("tidy_wearable_data.txt", header = TRUE)'

where "tidy_wearable_data.txt" includes any path needed to point from your working directory to where you downloaded this file.  

This work is based on the work of the individuals below:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

All source data is a result of their work, and variable names and features were inherited from their codebook.  

