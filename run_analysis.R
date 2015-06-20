

## Getting and Cleaning Data
## Course Project
## by Mark Mazurkiewicz


#### Test Data ----

# First let's list the files and store the names
(fileList <- list.files("../UCI HAR Dataset/test", full.names = TRUE))

# Now let's get the subject ID number
subjectTest <- read.table(fileList[2], header = FALSE, col.names = c("Subject"), stringsAsFactors = FALSE)

# And let's get activity ID number
activityTest <- read.table(fileList[4], header = FALSE, col.names = c("Activity"), stringsAsFactors = FALSE)

# We only want to extract the mean and standard deviation and these are located in the first six columns of the data. We will use colClasses to do this:
dataTest <- read.table(fileList[3], header = FALSE, colClasses = c(rep("numeric", 6), rep("NULL", 555)))

# Okay, so we have all the data we need, now let's rename the variables
names(subjectTest)[1] <- "ParticipantID"
names(activityTest)[1] <- "ActivityID"
names(dataTest)[1:6] <- c("MeanXAccel", "MeanYAccel", "MeanZAccel", "SdXAccel", "SdYAccel", "SdZAccel")

# Et voila -- let's combine data frames them to make a nice dataset
finalData <- cbind(subjectTest, activityTest, dataTest)

# But we have to label this as test data and not train data
finalDataTest <- data.frame(finalData, DataType = c("test"))

#### Train Data ----

# Okay, let's do it all again for the train data

# First let's list the files and store the names
(fileList <- list.files("../UCI HAR Dataset/train", full.names = TRUE))

# Now let's get the subject ID number
subjectTrain <- read.table(fileList[2], header = FALSE, col.names = c("Subject"), stringsAsFactors = FALSE)

# And let's get activity ID number
activityTrain <- read.table(fileList[4], header = FALSE, col.names = c("Activity"), stringsAsFactors = FALSE)

# We only want to extract the mean and standard deviation and these are located in the first six columns of the data. We will use colClasses to do this:
dataTrain <- read.table(fileList[3], header = FALSE, colClasses = c(rep("numeric", 6), rep("NULL", 555)))

# Okay, so we have all the data we need, now let's rename the variables
names(subjectTrain)[1] <- "ParticipantID"
names(activityTrain)[1] <- "ActivityID"
names(dataTrain)[1:6] <- c("MeanXAccel", "MeanYAccel", "MeanZAccel", "SdXAccel", "SdYAccel", "SdZAccel")

# Et voila -- let's combine data frames them to make a nice dataset
finalData <- cbind(subjectTrain, activityTrain, dataTrain)

# But we have to label this as train data and not test data
finalDataTrain <- data.frame(finalData, DataType = c("train"))

# Let's do some cleaning
rm(activityTest,activityTrain,dataTest, dataTrain,finalData,subjectTest,subjectTrain)

#### Merging Data ----

# Okay, so we now have two clean datasets that we need to merge.
# Test and see if they match!
(names(finalDataTest) == names(finalDataTrain))

# Let's merge them and then rename one of the columns so it makes more sense.
finalDataSet <- rbind(finalDataTest, finalDataTrain)
names(finalDataSet)[9] <- "DataSource"

# Now let's change the ActivityID values to a factor and add attributes.
finalDataSet$ActivityID <- factor(finalDataSet$ActivityID,labels=c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

# Some final housecleaning
rm(finalDataTrain, finalDataTrain, fileList, finalDataTest)

# And then we are done. Our clean data set has arrived.
write.table(finalDataSet, file = "tidyDataSet.txt", sep =",", row.names = FALSE)



