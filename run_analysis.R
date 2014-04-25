# load data

column_names <- read.table("features.txt")
activity_names <- read.table("activity_labels.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Add subject numbers and activity numbers

test_data <- cbind(subject_test,y_test,x_test)
train_data<- cbind(subject_train,y_train,x_train)

# Merge the two data sets

full_data <- rbind(test_data,train_data)

# Add column names
col_names <- c("Subject","Activity_Desc",as.character(column_names[,2]))

names(full_data)<-col_names

# Clean up a bit
rm("column_names","x_train","y_train","subject_train","x_test","y_test",
   "subject_test","test_data","train_data")

# Select only the means and stds
full_data <- cbind(full_data[,1:8],full_data[,43:48],full_data[,83:88],
               full_data[,123:128],full_data[,163:168],full_data[,203:205],
               full_data[,216:217],full_data[,229:230],full_data[,242:243],
               full_data[,255:256],full_data[,268:273],full_data[,347:352],
               full_data[,426:431],full_data[,505:506],full_data[,518:519],
               full_data[,531:532],full_data[,544:545])

# Convert activity numbers to names
for(i in 1:length(full_data[,2])){
  full_data[i,2] <- as.character(activity_names[full_data[i,2],2])
}

#Take means by subject and activity
library(reshape2)

dataMelt <- melt(full_data,id=c("Subject","Activity_Desc"))
tidied <- dcast(dataMelt, Subject + Activity_Desc ~ variable, mean)

# write to file
write.table(tidied,file="tidy_data.txt")