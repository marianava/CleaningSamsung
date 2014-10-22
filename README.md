CleaningSamsung
===============

Assignment Coursera project

The R code named "run.analysis.R" allows us to go from the raw datasets (in the data directory) to the step5.dtfr which is the tidy dataset required by the assignment.  
This involved merging datasets, naming variables, extracting only variables derived from computing means or standard deviations, and collapsing in an average these measurements for each subject and each activity.
The tidy data "step5.dtfr" has 180 rows and 86 columns.  
Each row represent a subject for a given ACTIVITY. SInce there are 30 subjects volunteering in the study, and they are measured in 6 different activities, this totals 180 rows.  
The remaining 84 variables are the averages for each numeric variable computed as a mean or a standard deviation from the original full dataset.
