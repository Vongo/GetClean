### 0) Download, read and prepare the data

# You might have to uncomment the following in order to run the code.
# install.packages('downloader')
# install.packages('data.table')

# Require packages
require(data.table)
require(downloader)

# Define constants
dirName <- "UCI HAR Dataset"
trainPath <- "train/"
testPath <- "test/"

# Download the data from distant repo if the proper folder it is not in the working directory
if(sum(grepl(dirName, list.files("."))) == 0){
	url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	tmp <- tempfile(fileext = ".zip")
	download(url, tmp)
	dir <- unzip(tmp)
	# Make sure the newly created directory has the right name
	dirName <- strsplit(dir[1], '/')[[1]][2]
}

path <- paste("./", dirName, "/", sep = "")

# Load the data into wisely named objects ;)
xTrain <- read.table(paste(path, trainPath, "X_train.txt", sep = ""))
yTrain <- read.table(paste(path, trainPath, "y_train.txt", sep = ""))
xTest <- read.table(paste(path, testPath, "X_test.txt", sep = ""))
yTest <- read.table(paste(path, testPath, "y_test.txt", sep = ""))
subjectTrain <- read.table(paste(path, trainPath, "subject_train.txt", sep = ""))
subjectTest <- read.table(paste(path, testPath, "subject_test.txt", sep = ""))

## Load & fill variable names
# Load
names <- read.table(paste(path, "features.txt", sep=""))
names <- names[,2]
activityLabels <- read.table(paste(path, "activity_labels.txt", sep=""))
colnames(activityLabels) <- c("Id","Label")
# Fill
colnames(xTrain) <- names
colnames(xTest) <- names
colnames(yTrain) <- "Activity"
colnames(yTest) <- "Activity"
colnames(subjectTrain) <- "Subject"
colnames(subjectTest) <- "Subject"

### 1) Merges the training and the test sets to create one data set.

xD <- rbind(xTest,xTrain)
yD <- rbind(yTest,yTrain)
subjectD <- rbind(subjectTrain,subjectTest)

xMeanStd <- xD[,c(grep("mean\\(\\)", names),grep("std\\(\\)", names))]

theOneTrueData <- cbind(yD,subjectD,xMeanStd)

### 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
DT <- data.table(theOneTrueData)
output <- as.data.frame(DT[,lapply(.SD, mean), by = c("Activity","Subject")])

### 3) Uses descriptive activity names to name the activities in the data set
### 4) Appropriately labels the data set with descriptive variable names.
# note that 90% of the job was done before merging the data.
output <- merge(output, activityLabels, by.x = "Activity", by.y = "Id")

### 5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data <- split(output, list(output$Subject, as.factor(output$Activity)))
activities <- colnames(output)[3:67]
newOne <- lapply(data, function(x) colMeans(x[,c(activities)]))

## Make it pretty and export
# Remove the activity Id (cosmetics)
output <- output[,-1]
# Put the activity label in the first row
output <- output[, c(ncol(output), 1:(ncol(output)-1))]

write.table(output, paste("./", "TidyData.txt", sep=""), row.names = FALSE)
