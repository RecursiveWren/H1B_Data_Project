## This file contains scripts to read in raw data, clean/handle NULL entries, and 
## create data subsets to be used in later analysis
library(readr)
library(mice)
library(VIM)

options(scipen=6)

# Read in H1B data 
h1b_kaggle <- read_csv("C:/Users/Aubrey/Desktop/h1b_kaggle.csv")

# make copy of data and drop first col
visa_data<-h1b_kaggle
visa_data$X1<-NULL

# Change all strings values to uppercase
visa_data<- as.data.frame(sapply(visa_data, toupper))

 #Evaluate Missing Values via mice library
md.pattern(visa_data)
aggr_plot <- aggr(visa_data, col=c('navyblue','red'), numbers=TRUE, sortVars=TRUE, labels=names(visa_data), cex.axis=.7, gap=3, ylab=c("Missing Data","Pattern of Missing Data"))

# Remove NULL Records
visa_data<-na.omit(visa_data)

bin_case_status <-subset(visa_data, CASE_STATUS=="DENIED"|CASE_STATUS=="CERTIFIED")

##data frame with all denied and all certified data
denied<-subset(visa_data, CASE_STATUS=="DENIED")
certified<-subset(visa_data, CASE_STATUS=="CERTIFIED")

# Sampling denied and certified sets to create a new set to be use for prediction modeling
denied_sample<-denied[sample(nrow(denied),2500),]
certified_sample<-certified[sample(nrow(certified), 2500),]

##Append denied and certified samples for use in creating CASE_STATUS prediction models
pred_samples<-rbind(denied_sample, certified_sample)

## Function to normalize data for future modeling
normalize<-function(x){return((x-min(x))/(max(x)-min(x)))}
