# install.packages('downloader')
require(downloader)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
tmp <- tempfile(fileext = ".zip")
download(url, tmp)
dir <- unzip(tmp)

