---
title: "ReadMe"
author: "Mark Mazurkiewicz"
date: "June 20, 2015"
output: html_document
---

# Running the Function

Before running this code, please ensure that the raw dataset is located in the working directory and extracted/placed in a folder called: UCI HAR Dataset. Once you run the code, you will produce a tidy data set that has exactly nine columns in it. The first row contains the column names and each additional row represents a case.

# Description of the Original Dataset 

The most difficult part of this dataset is understanding the stucture and content of the data. For the purposes of the assignment we need the following variables, which are split into both the test and train folders:

**subject_train** shows the participant number

**y_train** is the activity label (which can be found in a separate file called activity_labels)

**X_train** is the vector data of which elements 1 - 6 (out of of 561) are the mean and standard deviation as follows:

```
1 tBodyAcc-mean()-X
2 tBodyAcc-mean()-Y
3 tBodyAcc-mean()-Z
4 tBodyAcc-std()-X
5 tBodyAcc-std()-Y
6 tBodyAcc-std()-Z
```

# Extracted Dataset

The run_analysis.R function walks through the directory structure and read the files so we can pull out the data we want. The trickiest part is this line of code:

`dataTest <- read.table(fileList[3], header = FALSE, colClasses = c(rep("numeric", 6), rep("NULL", 555)))`

This basically tells R to pull out only the first six elements (or columns) of each line in the `X_train.txt and X_test.txt` files. These six elements are the means for x,y,z and standard deviations for x,y,z. These are the variables we want. 

After running run_analysis.R, one will produce a **comma-delimited text file** called "tidyDataSet.txt" that will contain the following variables:

```
ParticipantID
ActivityID (with factor labels)

MeanXAccel
MeanYAccel
MeanZAccel

SdXAccel
SdYAccel
SdZAccel

DataSource

```
For more information on the variables, please see the Codebook.md file.


