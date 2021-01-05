library('dplyr')
library(tidyverse)

predictMPG_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

#create linear model
lm(mpg ~ vehicle_weight,predictMPG_table) #create linear model #create linear model

#summarize linear model
summary(lm(mpg ~ vehicle_weight,predictMPG_table)) #summarize linear model

#generate multiple linear regression model
lm(mpg ~ vehicle_weight + vehicle_length + spoiler_angle + ground_clearance + AWD,predictMPG_table) #generate multiple linear regression model

#generate summary statistics
summary(lm(formula = mpg ~ vehicle_weight + vehicle_length + spoiler_angle + 
             ground_clearance + AWD, data = predictMPG_table))  #generate summary statistics

#import and read in the Suspension_Coil.csv file as a table
tripAnalysis_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

#an RScript that creates a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil's PSI column.
total_summnary <- tripAnalysis_table %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

#an RScript that creates a lot_summary dataframe using the group_by() and the summarize() functions to group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil's PSI column.
lot_summnary <- tripAnalysis_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')

#compare sample versus population means
t.test(tripAnalysis_table$PSI,mu=1500)

#3 more RScripts in your MechaCarChallenge.RScript using the t.test() function and its subset() argument to determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.
lot1_test <- subset(tripAnalysis_table, Manufacturing_Lot=='Lot1')  
lot2_test <- subset(tripAnalysis_table, Manufacturing_Lot=='Lot2')  
lot2_test <- subset(tripAnalysis_table, Manufacturing_Lot=='Lot3')  

t.test(lot1_test$PSI,mu=1500)
t.test(lot2_test$PSI,mu=1500)
t.test(lot3_test$PSI,mu=1500)