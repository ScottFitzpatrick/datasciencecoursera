# Coursera Getting and Cleaning Data course project submission: run_analysis.R
rm(list = ls())
library(dplyr)
library(tidyr)
workingfolder <- "C:/Users/SFitzpatrick/Desktop/Coursera/Getting and Cleaning Data course project/UCI HAR Dataset/"

# gather data applicable to both test and training data sets
activitylabels <- read.table(paste0(workingfolder, "activity_labels.txt"))
features <- read.table(paste0(workingfolder, "features.txt"))
meanandstd <- intersect(grep("mean|std", features[, 2]), grep("meanFreq", features[, 2], invert = TRUE))

# gather test data
testfolder <- paste0(workingfolder, "test/")
testdataset <- read.table(paste0(testfolder, "X_test.txt"))
colnames(testdataset) <- features[, 2]
testdataset <- testdataset[, meanandstd]
testdataset$subject <- unlist(read.table(paste0(testfolder, "subject_test.txt")))
testdataset$activitiycode <- unlist(read.table(paste0(testfolder, "Y_test.txt")))

# gather training data
trainfolder <- paste0(workingfolder, "train/")
traindataset <- read.table(paste0(trainfolder, "X_train.txt"))
colnames(traindataset) <- features[, 2]
traindataset <- traindataset[, meanandstd]
traindataset$subject <- unlist(read.table(paste0(trainfolder, "subject_train.txt")))
traindataset$activitiycode <- unlist(read.table(paste0(trainfolder, "Y_train.txt")))

# merge data sets into 'fulldataset'
fulldataset <- bind_rows(testdataset, traindataset)
fulldataset <- merge(fulldataset, activitylabels, by.x = 68, by.y = 1)
fulldataset$V2 <- as.character(fulldataset$V2)
fulldataset$activitiycode <- NULL
colnames(fulldataset)[68] <- "activity"
rm(testdataset, traindataset, meanandstd, testfolder, trainfolder, features, activitylabels)

# tidy fulldataset into 'tidydataset'
tidydataset <- fulldataset %>% group_by(subject, activity) %>% summarise_each(funs(mean))
tidydataset <- ungroup(tidydataset)
tidydataset <- gather(tidydataset, feature, value, 3:68)
tidydataset <- separate(tidydataset, feature, into = c("feature", "direction"), sep = "\\(")
tidydataset$direction <- sub(")", "", tidydataset$direction)
tidydataset$direction <- sub("-", "", tidydataset$direction)
tidydataset <- separate(tidydataset, feature, into = c("feature", "measure"))
tidydataset <- spread(tidydataset, measure, value)
colnames(tidydataset) <- c("subjectnumber", "activity", "feature", "direction", "avgmean", "avgstd")

