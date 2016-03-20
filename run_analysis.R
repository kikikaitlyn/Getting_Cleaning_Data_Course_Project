download.packages("plyr")
library(plyr)
setwd("./")
#######################################################################################################
# Step 1 - Merge the training and test sets to create one data set
#######################################################################################################

#import feature data + col name, then import activity_labels data + col name
features     = read.table('features.txt',header=FALSE);
activity_labels = read.table('activity_labels.txt',header=FALSE); 
colnames(activity_labels)  = c('ActivityId','ActivityType');

#import train data: x, y, subject_train data with col names
x_train <- read.table("train/X_train.txt",header=FALSE)
colnames(x_train)        = features[,2];
y_train <- read.table("train/y_train.txt",header=FALSE)
colnames(y_train)        = "ActivityId";
subject_train <- read.table("train/subject_train.txt")
colnames(subject_train)  = "SubjectId";

# Create final training set by merging y_train, subject_train, and x_train
TrainingData = cbind(y_train,subject_train,x_train);
head(trainingData)

#import text data
x_test <- read.table("test/X_test.txt")
colnames(x_test)        = features[,2];
y_test <- read.table("test/y_test.txt")
colnames(y_test)        = "ActivityId";
subject_test <- read.table("test/subject_test.txt")
colnames(subject_test)  = "SubjectId";

# Create final test set by merging y_test, subject_test, and x_test
TestData = cbind(y_test,subject_test,x_test);
names(TestData)


# create final data set
FinalData = rbind(trainingData,TestData);


#####################################################################################################
# Step 2 Extract only the measurements on the mean and standard deviation for each measurement
#####################################################################################################

# Create a vector with colnames
ColNames  = colnames(FinalData); 

# Create a logicalVector that contains TRUE values for the ID, mean() & stddev() columns and FALSE for others
VarToKeep = (grepl("Activity..",ColNames) | grepl("Subject..",ColNames) | grepl("-mean..",ColNames) & !grepl("-meanFreq..",ColNames) & !grepl("mean..-",ColNames) | grepl("-std..",ColNames) & !grepl("-std()..-",ColNames));

# Subset finalData table based on the logicalVector to keep only desired columns
FinalData2 = FinalData[VarToKeep==TRUE];
names(FinalData2)




#####################################################################################################
# Step 3 Use descriptive activity names to name the activities in the data set
#####################################################################################################

# Merge FinalData2 set with the acitivityType 
FinalData3 = merge(FinalData2,activity_labels,by='ActivityId',all.x=TRUE);
head(FinalData3)

#####################################################################################################
# Step 4 Appropriately label the data set with descriptive activity names. 
#####################################################################################################

# reorganize data
ColNames  = colnames(FinalData3); 
  ColNames<-gsub("\\()","",ColNames)
  ColNames = gsub("^(t)","Time",ColNames)
  ColNames = gsub("^(f)","Freq",ColNames)
  ColNames<-gsub("-mean","Mean",ColNames)
  ColNames<-gsub("-std","StdDev",ColNames)
  ColNames <- gsub('Acc',"Acceleration",ColNames)
  ColNames <- gsub('GyroJerk',"AngularAcceleration",ColNames)
  ColNames <- gsub('Gyro',"AngularSpeed",ColNames)
  ColNames <- gsub('Mag',"Magnitude",ColNames)
  ColNames <- gsub('BodyBody',"Body",ColNames)
  
# rename variable with good names
colnames(FinalData3) <- ColNames;  
names(FinalData3)

#############################################################################################################################
# Step 5 Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
#############################################################################################################################

#calculate average
TidyData = ddply(FinalData3[,-1], c("ActivityType","SubjectId"), numcolwise(mean))
head(TidyData)

 
write.table(TidyData, './tidyData.txt',row.name=FALSE,sep='\t');

