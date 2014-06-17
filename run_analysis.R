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

# Download the data from distant repo if the proper filder it is not in the working directory
if(sum(grepl(dirName, list.files("."))) == 0){
	url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	tmp <- tempfile(fileext = ".zip")
	download(url, tmp)
	dir <- unzip(tmp)
	# Make sure the newly created directory has the right name
	dirName <- strsplit(dir[1], '/')[[1]][2]
}

path <- paste("./", dirName, "/", sep = "")

# Load the data into data.table objects wisely named ;)
xTrain <- read.table(paste(path, trainPath, "X_train.txt", sep = ""))
yTrain <- read.table(paste(path, trainPath, "y_train.txt", sep = ""))
xTest <- read.table(paste(path, testPath, "X_test.txt", sep = ""))
yTest <- read.table(paste(path, testPath, "y_test.txt", sep = ""))
subjectTrain <- read.table(paste(path, trainPath, "subject_train.txt", sep = ""))
subjectTest <- read.table(paste(path, testPath, "subject_test.txt", sep = ""))

