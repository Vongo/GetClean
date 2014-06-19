GetClean
========

Coursera Getting and Cleaning Data Course project.

# How to use

Simply execute run_analysis.R script using <br/>
source('run_analysis.R') <br/>
Or copy the content of run_analysis.R in your R console.

# File list

<strong>CodeBook.md </strong>		Code book that describes the variables, the data, and any transformations or work performed to clean up the data <br/>
<strong>run_analysis.R</strong> 	R script that performs the analysis described in CodeBook.<br/>
<strong>README.md </strong>			Read it ! <br/>
<strong>LICENCE 	</strong>Artistic Licence because R is so beautiful ! (Not speaking for my code... yet) <br/>
<strong>.gitignore 	</strong>Ignore it ! <br/>
<strong>TidyData.txt</strong> 		A tidy data set according to the instructions in the project description

# FAQ

Q : Do I have to download the dataset, unzip it, and put it inside whatever folder you want ? <br/>
A : You can do it if you really want to. Or let the script manage this for you.

Q : It doesn't work, package not found !! <br/>
A : Simply uncomment the install.package line (at the top of run_analysis.R) corresponding to the error you get. I guess it's because of the "downloader" package, which is great BTW. Very easy to use, and works well !

Q : Why the hell did you write a FAQ ? <br/>
A : Why the hell are you reading it ?

Q : What grade do you want ? <br/>
A : Hum, tough question. What grade would you give me ?

## What does run_analysis.R do ?

- Downloads & unzips the dataset if it is not already in the working directory (0)
- Loads the data (0)
- Names data object variables (3,4)
- Merges the training and the test sets to create one data set (output) (1)
- Extracts the measurements on the mean and standard deviation for each measurement, and groups the data by activity and subject. (2,5)
- Affects activity names (3,4)
