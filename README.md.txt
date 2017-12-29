==================================================================
The Tidy dataset prepared from the original Human Activity Recognition Using Smartphones Dataset Version 1.0
==================================================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

Study Design:
======================================
The dataset is taken directly from the download file URL as below.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The zipped folder is directly downloaded using the download.file in R Studio (R version 3.4.3) in the 64 bit Windows 7 operating system.
The file is then unzipped using the unzip function within R.

For each record it is provided:
======================================
- An identifier of the subject who carried out the experiment.
- Its activity label. 
- 66 other variables showing the mean (mean of mean and standard deviation) by each activity and subject. 

The dataset includes the following files:
=========================================
- 'README.txt': This file is the codebook for the dataset. 
- 'tidydataset.txt': This file contains the average of obsevations of mean and standard deviations for each activity and subject.

Instruction set:
=========================================
the R code file run_analysis.R fetches the original dataset from download url and processes the tidy_data dataset.

Variable description:
=========================================
[1] "SubjectIdentifier": This identifes the subject who performed the experiment. each person is assigned with
a number for identification.           
[2] "ActivityLabels": This is the activity performed by the subject. There were a total of 6 activities performed by the subjects. WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING   

The below features record an average of mean and standard deviations of below mentioned activities
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

=========================================      [3] "TimeBodyAccmeanX"            
[4] "TimeBodyAccmeanY"           
[5] "TimeBodyAccmeanZ"            
[6] "TimeBodyAccstdX"            
[7] "TimeBodyAccstdY"             
[8] "TimeBodyAccstdZ"            
[9] "TimeGravityAccmeanX"         
[10] "TimeGravityAccmeanY"        
[11] "TimeGravityAccmeanZ"         
[12] "TimeGravityAccstdX"         
[13] "TimeGravityAccstdY"          
[14] "TimeGravityAccstdZ"         
[15] "TimeBodyAccJerkmeanX"        
[16] "TimeBodyAccJerkmeanY"       
[17] "TimeBodyAccJerkmeanZ"        
[18] "TimeBodyAccJerkstdX"        
[19] "TimeBodyAccJerkstdY"         
[20] "TimeBodyAccJerkstdZ"        
[21] "TimeBodyGyromeanX"           
[22] "TimeBodyGyromeanY"          
[23] "TimeBodyGyromeanZ"           
[24] "TimeBodyGyrostdX"           
[25] "TimeBodyGyrostdY"            
[26] "TimeBodyGyrostdZ"           
[27] "TimeBodyGyroJerkmeanX"       
[28] "TimeBodyGyroJerkmeanY"      
[29] "TimeBodyGyroJerkmeanZ"       
[30] "TimeBodyGyroJerkstdX"       
[31] "TimeBodyGyroJerkstdY"        
[32] "TimeBodyGyroJerkstdZ"       
[33] "TimeBodyAccMagmean"          
[34] "TimeBodyAccMagstd"          
[35] "TimeGravityAccMagmean"       
[36] "TimeGravityAccMagstd"       
[37] "TimeBodyAccJerkMagmean"      
[38] "TimeBodyAccJerkMagstd"      
[39] "TimeBodyGyroMagmean"         
[40] "TimeBodyGyroMagstd"         
[41] "TimeBodyGyroJerkMagmean"     
[42] "TimeBodyGyroJerkMagstd"     
[43] "FreqBodyAccmeanX"            
[44] "FreqBodyAccmeanY"           
[45] "FreqBodyAccmeanZ"            
[46] "FreqBodyAccstdX"            
[47] "FreqBodyAccstdY"             
[48] "FreqBodyAccstdZ"            
[49] "FreqBodyAccJerkmeanX"        
[50] "FreqBodyAccJerkmeanY"       
[51] "FreqBodyAccJerkmeanZ"        
[52] "FreqBodyAccJerkstdX"        
[53] "FreqBodyAccJerkstdY"         
[54] "FreqBodyAccJerkstdZ"        
[55] "FreqBodyGyromeanX"           
[56] "FreqBodyGyromeanY"          
[57] "FreqBodyGyromeanZ"           
[58] "FreqBodyGyrostdX"           
[59] "FreqBodyGyrostdY"            
[60] "FreqBodyGyrostdZ"           
[61] "FreqBodyAccMagmean"          
[62] "FreqBodyAccMagstd"          
[63] "FreqBodyBodyAccJerkMagmean"  
[64] "FreqBodyBodyAccJerkMagstd"  
[65] "FreqBodyBodyGyroMagmean"     
[66] "FreqBodyBodyGyroMagstd"     
[67] "FreqBodyBodyGyroJerkMagmean" 
[68] "FreqBodyBodyGyroJerkMagstd" 
 