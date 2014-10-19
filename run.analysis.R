## CLEANING DATA SAMSUNG DATASETS

## read features.txt into R
features <- read.table("./features.txt",stringsAsFactors = FALSE)


## TEST DATASETS (9 subjects)
# read 3 "test" datasets 
subj.test <- read.table("./subject_test.txt")
X.test <- read.table("./X_test.txt")
y.test <- read.table("./y_test.txt")

## assign names to all variables
names(subj.test) <- "ID"
names(y.test) <- "ACTIVITY"
names(X.test) <- features[,2]

## Same for "train" datasets
## TRAIN DATASETS (21 subjects)
subj.train <- read.table("./subject_train.txt")
X.train <- read.table("./X_train.txt")
y.train <- read.table("./y_train.txt")

names(subj.train) <- "ID"
names(y.train) <- "ACTIVITY"
names(X.train) <- features[,2]


############## MERGING
# create 2 dataframes, one for test and one for train
test.dtfr <- data.frame(subj.test,y.test,X.test)
train.dtfr <- data.frame(subj.train,y.train,X.train)

# merge both dataframes into one 
full.dtfr <- rbind(test.dtfr,train.dtfr)

##### edit levels for variable ACTIVITY
full.dtfr$ACTIVITY <- as.factor(full.dtfr$ACTIVITY)
levels(full.dtfr$ACTIVITY) <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

#########  EXtraction of measurements with mean or std on each measurement
mean.vars <- grep("mean",features[,2])
Mean.vars <- grep("Mean",features[,2])
std.vars <- grep("std",features[,2]) 
select.vars <- c(mean.vars,Mean.vars,std.vars)

temp.dataset <- full.dtfr[,select.vars]

############ CREATES SECOND TIDY DATASET with the average of each variable for each activity and each subject
# step5.dtfr is a dataframe with 86 rows and 563 variables. For more info README.md

step5.dtfr <- aggregate(.~ ID+ACTIVITY,data=temp.dataset,mean)


