Readme for run_analysis.R
==========================

The data set is comprised of 30 subjects each performing 6 different activities which are
the following:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

A total of 561 observations are recorded of which the 67 which contain mean or the standard
deviation of measurements are output in this script.


Steps used in the script
--------------------------

1.  Data files are loaded using `read.table`.
2.  Subject and Activity labels are appended to the main observations using `cbind`.
3.  Test and train data sets are merged using `rbind`.
4.  Column names are added.
5.  Data is trimmed to only include observations with `mean()` or `std()`.
6.  Activity numbers are converted to their corresponding names.
7.  Average the means and standard deviations by subject and activity
8.  Write tidy data set to file
