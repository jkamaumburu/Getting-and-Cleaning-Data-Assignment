______________
_____________
Steps to execute the code
1. Ensure that the current directory is set in such a way that R can get the file location.
2. Execute the code snippets one at a time or the entire function at once by calling the run_analysis.R using Source, followed by run_analysis() function call
3. Most of the other sections are as shown below:
4. IT requires package dplyr installed and loaded.

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