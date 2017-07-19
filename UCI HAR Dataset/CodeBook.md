#The variables in the dataset are as follows:

##The other varibles were as obtained from the experiment data. 
##First column represents the old column/variable name while the second is the new name after transformation.
    activity - activity name
    lables - the participant/volunteer
    
    V1 tBodyAcc-mean()-X
    V2 tBodyAcc-mean()-Y
    V3 tBodyAcc-mean()-Z
    V4 tBodyAcc-std()-X
    V5 tBodyAcc-std()-Y
    V6 tBodyAcc-std()-Z
    V41 tGravityAcc-mean()-X
    V42 tGravityAcc-mean()-Y
    V43 tGravityAcc-mean()-Z
    V44 tGravityAcc-std()-X
    V45 tGravityAcc-std()-Y
    V46 tGravityAcc-std()-Z
    V81 tBodyAccJerk-mean()-X
    V82 tBodyAccJerk-mean()-Y
    V83 tBodyAccJerk-mean()-Z
    V84 tBodyAccJerk-std()-X
    V85 tBodyAccJerk-std()-Y
    V86 tBodyAccJerk-std()-Z
    V121 tBodyGyro-mean()-X
    V122 tBodyGyro-mean()-Y
    V123 tBodyGyro-mean()-Z
    V124 tBodyGyro-std()-X
    V125 tBodyGyro-std()-Y
    V126 tBodyGyro-std()-Z
    V161 tBodyGyroJerk-mean()-X
    V162 tBodyGyroJerk-mean()-Y
    V163 tBodyGyroJerk-mean()-Z
    V164 tBodyGyroJerk-std()-X
    V165 tBodyGyroJerk-std()-Y
    V166 tBodyGyroJerk-std()-Z
    V201 tBodyAccMag-mean()
    V202 tBodyAccMag-std()
    V214 tGravityAccMag-mean()
    V215 tGravityAccMag-std()
    V227 tBodyAccJerkMag-mean()
    V228 tBodyAccJerkMag-std()
    V240 tBodyGyroMag-mean()
    V241 tBodyGyroMag-std()
    V253 tBodyGyroJerkMag-mean()
    V254 tBodyGyroJerkMag-std()
    V266 fBodyAcc-mean()-X
    V267 fBodyAcc-mean()-Y
    V268 fBodyAcc-mean()-Z
    V269 fBodyAcc-std()-X
    V270 fBodyAcc-std()-Y
    V271 fBodyAcc-std()-Z
    V345 fBodyAccJerk-mean()-X
    V346 fBodyAccJerk-mean()-Y
    V347 fBodyAccJerk-mean()-Z
    V348 fBodyAccJerk-std()-X
    V349 fBodyAccJerk-std()-Y
    V350 fBodyAccJerk-std()-Z
    V424 fBodyGyro-mean()-X
    V425 fBodyGyro-mean()-Y
    V426 fBodyGyro-mean()-Z
    V427 fBodyGyro-std()-X
    V428 fBodyGyro-std()-Y
    V429 fBodyGyro-std()-Z
    V503 fBodyAccMag-mean()
    V504 fBodyAccMag-std()
    V516 fBodyBodyAccJerkMag-mean()
    V517 fBodyBodyAccJerkMag-std()
    V529 fBodyBodyGyroMag-mean()
    V530 fBodyBodyGyroMag-std()
    V542 fBodyBodyGyroJerkMag-mean()
    V543 fBodyBodyGyroJerkMag-std()
    V555 angle(tBodyAccMean,gravity)
    V556 angle(tBodyAccJerkMean),gravityMean)
    V557 angle(tBodyGyroMean,gravityMean)
    V558 angle(tBodyGyroJerkMean,gravityMean)
    V559 angle(X,gravityMean)
    V560 angle(Y,gravityMean)
    V561 angle(Z,gravityMean)

##Tranformations to the data were in the following steps in order to make the data available in R and in the required format
    1. Read the Data (Training set, Testing set,) using read.Table()
    2. Read data that holds the Labels (Training  labels, Testing Labels) using read.table()
    3. Adding Labels to the Training and Test Data sets using cbind()
    4. Read Data that hold subjects (Testing, Training)
    5. Add subjects to the Training and Test Data sets
    
## Meging Data
    1. Renamed columns to allow merging using Rbind
    2. Merged data using do.call
    
## Extract only Mean and SD columns
    1. This was done using Notepad++ where manual filtering was done to remove those columns that did not have mean and SD. 
    2. The list was filtered manually by reading the features_info.txt and features.txt files provided along with the assignment.
    3. Identify list of required columns - as a vector
    4. Select only the required columns
    
## Descriptive Names for the Activity Names
    1. This was done using gsub to replace the numbers with the appropriate text in activity_lables.txt file.
    
## creates a second, independent tidy data set
    1. Get the column mean and row mean. First row will be equal to the mean of each column while the column mean will be equal to the first row
    2. Write the new data into a text file 
    
## Notes
    Data is in similar units as those of the orginal dataset
    
    
