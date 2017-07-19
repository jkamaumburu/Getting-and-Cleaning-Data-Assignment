#Peer Graded Assignment for Week 3 

#Mandatory requirements - Read the Data (Training set, Testing set,)
 runa_analysis <- function(){
    trainData<-read.table(file = "/UCI HAR Dataset/train/X_train.txt")
    testData<-read.table(file = "/UCI HAR Dataset/test/X_test.txt")
    
    
    #Read Data that holds the Labels (Training  labels, Testing Labels)
    trainingLabels<-read.table("/UCI HAR Dataset/train/y_train.txt")
    testingLabels<-read.table("/UCI HAR Dataset/test/y_test.txt")
    
    #Add Labels to the Training and Test Data sets
    trainingwithLabels<- cbind(traininglabels=trainingLabels[,1],trainData)
    testingwithLabels<- cbind(testinglabels=testingLabels[,1],testData)
    
    #Read Data that hold Subjects (Testing, Training)
    testingsubjects<-read.table("/UCI HAR Dataset/test/subject_test.txt")
    trainingsubjects<-read.table("/UCI HAR Dataset/train/subject_train.txt")
    
    #Add subjects to the Training and Test Data sets
    trainingwithLabels<- cbind(trainingsubjects=trainingsubjects[,1],trainingwithLabels)
    testingwithLabels<- cbind(testingsubjects=testingsubjects[,1],testingwithLabels)


#Step 1 - Merge the data
#renamed columns to allow merging using Rbind

    #testing data
    colnames(testingwithLabels)[1]<- "activity"
    colnames(testingwithLabels)[2]<- "label"

    #training data
    colnames(trainingwithLabels)[1]<- "activity"
    colnames(trainingwithLabels)[2]<- "label"

    #Merge Data
    merged<-do.call("rbind", list(trainingwithLabels, testingwithLabels))


#Step 2 - Extract only Mean and SD columns
    #This was done using Notepad++ where manual filtering was done to remove those columns that did not have mean and SD. 
    #The list was filtered manually by reading the features_info.txt and features.txt files provided along with the assignment.
    #Identify list of required columns - as a vector
    
    colsRequired<-c('activity','label','V1', 'V2',  'V3',  'V4',  'V5',  'V6',  'V41', 'V42', 'V43', 'V44', 'V45', 'V46', 
    'V81', 'V82', 'V83', 'V84', 'V85', 'V86', 'V121','V122','V123','V124','V125','V126','V161','V162',
    'V163','V164','V165','V166','V201','V202','V214','V215','V227','V228','V240','V241','V253','V254',
    'V266','V267','V268','V269','V270','V271','V345','V346','V347','V348','V349','V350','V424','V425','V426','V427','V428','V429','V503','V504',
    'V516','V517','V529','V530','V542','V543','V555','V556','V557','V558','V559','V560','V561')
    
    #select only the required columns
    mergedSelectReqCols<-select(merged,colsRequired)

#Step 3 - Descriptive Names for the Activity Names. Notepad++ was also used to get the list of names from the txt file.
    ##This was done using gsub to replace the numbers with the appropriate text in activity_lables.txt file.
    mergedSelectReqCols$activity <- gsub('1', 'WALKING',mergedSelectReqCols$activity)
    mergedSelectReqCols$activity <- gsub('2', 'WALKING_UPSTAIRS',mergedSelectReqCols$activity)
    mergedSelectReqCols$activity <- gsub('3', 'WALKING_DOWNSTAIRS',mergedSelectReqCols$activity)
    mergedSelectReqCols$activity <- gsub('4', 'SITTING',mergedSelectReqCols$activity)
    mergedSelectReqCols$activity <- gsub('5', 'STANDING',mergedSelectReqCols$activity)
    mergedSelectReqCols$activity <- gsub('6', 'LAYING',mergedSelectReqCols$activity)
    
#step 4 - appropriate Labels the dataset with descriptive varible names
    colnames(mergedSelectReqCols)<-c('activity','lables','tBodyAcc-mean()-X','tBodyAcc-mean()-Y','tBodyAcc-mean()-Z','tBodyAcc-std()-X','tBodyAcc-std()-Y',
                                   'tBodyAcc-std()-Z','tGravityAcc-mean()-X','tGravityAcc-mean()-Y','tGravityAcc-mean()-Z','tGravityAcc-std()-X','tGravityAcc-std()-Y',
                                   'tGravityAcc-std()-Z','tBodyAccJerk-mean()-X','tBodyAccJerk-mean()-Y','tBodyAccJerk-mean()-Z','tBodyAccJerk-std()-X','tBodyAccJerk-std()-Y',
                                   'tBodyAccJerk-std()-Z','tBodyGyro-mean()-X','tBodyGyro-mean()-Y','tBodyGyro-mean()-Z','tBodyGyro-std()-X','tBodyGyro-std()-Y',
                                   'tBodyGyro-std()-Z','tBodyGyroJerk-mean()-X','tBodyGyroJerk-mean()-Y','tBodyGyroJerk-mean()-Z',
                                   'tBodyGyroJerk-std()-X','tBodyGyroJerk-std()-Y','tBodyGyroJerk-std()-Z','tBodyAccMag-mean()','tBodyAccMag-std()','tGravityAccMag-mean()','tGravityAccMag-std()','tBodyAccJerkMag-mean()',
                                   'tBodyAccJerkMag-std()','tBodyGyroMag-mean()','tBodyGyroMag-std()','tBodyGyroJerkMag-mean()','tBodyGyroJerkMag-std()','fBodyAcc-mean()-X','fBodyAcc-mean()-Y',
                                   'fBodyAcc-mean()-Z','fBodyAcc-std()-X','fBodyAcc-std()-Y','fBodyAcc-std()-Z','fBodyAccJerk-mean()-X','fBodyAccJerk-mean()-Y',
                                   'fBodyAccJerk-mean()-Z','fBodyAccJerk-std()-X ','fBodyAccJerk-std()-Y ','fBodyAccJerk-std()-Z ','fBodyGyro-mean()-X','fBodyGyro-mean()-Y','fBodyGyro-mean()-Z',
                                   'fBodyGyro-std()-X','fBodyGyro-std()-Y','fBodyGyro-std()-Z','fBodyAccMag-mean()','fBodyAccMag-std()','fBodyBodyAccJerkMag-mean()','fBodyBodyAccJerkMag-std()','fBodyBodyGyroMag-mean()',
                                   'fBodyBodyGyroMag-std()','fBodyBodyGyroJerkMag-mean()','fBodyBodyGyroJerkMag-std()','angle(tBodyAccMean,gravity)','angle(tBodyAccJerkMean),gravityMean)','angle(tBodyGyroMean,gravityMean)','angle(tBodyGyroJerkMean,gravityMean)','angle(X,gravityMean)',
                                   'angle(Y,gravityMean)','angle(Z,gravityMean)')
    
#Step 5 - creates a second, independent tidy data set with the average of each variable for each activity and each subject
    #Get the column mean and row mean. First row will be equal to the mean of each column while the column mean will be equal to the first row.
    newData <- rbind(colMean=colMeans(mergedSelectReqCols[,-c(1,2)]),cbind(rowMean=rowMeans(mergedSelectReqCols[,-c(1,2)]),mergedSelectReqCols))
    
    #Write the new data into a text file 
    write.table(newData,"cleandata.txt",sep="\t",row.names=FALSE)
    
 }