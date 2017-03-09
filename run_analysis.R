library(reshape2)


#Reading the data
test_sub<- read.table("./test/subject_test.txt")
test_x <- read.table("./test/X_test.txt")
test_y <- read.table("./test/y_test.txt")

train_sub <- read.table("./train/subject_train.txt")
train_x <- read.table("./train/X_train.txt")
train_y <- read.table("./train/y_train.txt")

features <- read.table("./features.txt")
activity_labels <- read.table("./activity_labels.txt")

#Merging test and train datasets for subject, features and label, applying the correct heading
subject<-rbind(test_sub,train_sub)
colnames(subject)<-"subject"

data<-rbind(test_x,train_x)
colnames(data)<-features[,2]

label <- rbind(test_y, train_y)
label <- merge(label,activity_labels,by=1)
label <- label[,2]

#Merging all data
data<-cbind(subject,label,data)

#Searching the indices for variables containing mean and std values.
extr <- grep("-mean|-std", colnames(data))

#Extracting the columns for subject (1), activity (label) and mean/std variables
data_meanstd <- data[,c(1,2,extr)]

#Creating independent tidy data, with the avg of each variable for each activity and each subject
aux = melt(data_meanstd, id.var = c("subject", "label"))
tidy_data = dcast(aux , subject + label ~ variable, mean)

#Creating a tidy data file
write.table(tidy_data, file="tidy_data.txt", row.name=FALSE)

