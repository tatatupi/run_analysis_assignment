# run_analysis.R README
This script was designed to cover all steps from Getting and Cleaning Data Course Project, cleaning a set of data of Human Activity Recognition Using Smartphones, available on: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
In order for this script to run properly, the data shall be downloadad and unzipped into the same directory.

It starts by calling the "reshape2" library.

Afterwards it reads all tables into variables, in order to merge all into one dataset, named "data"

Once the data is merged, it will extract only the columns that have mean or std information. 

Finally, it calculates the average of each variable for each activity and each subject and exports into a tidy_data.txt file.
