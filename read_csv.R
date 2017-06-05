# Read in H1B data 
library(readr)
h1b_kaggle <- read_csv("C:/Users/Aubrey/Desktop/h1b_kaggle.csv")

# make copy of data and drop first col
visa_data<-h1b_kaggle
visa_data<-data.frame(visa_data)
visa_data$X1<-NULL

library(mice)
library(VIM)
library(ggplot2)
library(dplyr)
library(dtplyr)


#Evaluate Missing Values (Deciding whether/how to impute values)
md.pattern(visa_data)
aggr_plot <- aggr(visa_data, col=c('navyblue','red'), numbers=TRUE, sortVars=TRUE, labels=names(visa_data), cex.axis=.7, gap=3, ylab=c("Missing Data","Pattern of Missing Data"))

#General stats
str(visa_data)
summary(visa_data)


