---
title: "Codebook"
author: "Mark Mazurkiewicz"
date: "June 20, 2015"
output: html_document
---

# Background Information #

The data below was taken from the following experimenters:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experimenter's description of the study is as follows: 

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


# Columns / Variable Names #

The following are the final columns produced by the run_analysis.R script:

**ParticipantID**: The participant ID number in the experiment.

**ActivityID**: A factor variable with labels that tells you the activity the participant was doing when they were being measured. 

     1 = WALKING
     2 = WALKING_UPSTAIRS
     3 = WALKING_DOWNSTAIRS
     4 = SITTING
     5 = STANDING
     6 = LAYING

The following Accel variables are all measured in acceleration units, or meters per second squared. 

**MeanXAccel**: Acceleration along the X axis.

**MeanYAccel**: Acceleration along the Y axis.

**MeanZAccel**: Acceleration along the Z axis.

**SdXAccel**: Standard deviation of acceleration along the X axis.

**SdYAccel**: Standard deviation of acceleration along the Y axis.

**SdZAccel**: Standard deviation of acceleration along the Z axis.

The final column is:

**DataSource**: A factor variable denoting if this was training or testing data.
