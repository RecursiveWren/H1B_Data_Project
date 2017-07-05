## This file contains scripts for generating discriptive stats and visualizations
## This will be performed on the "cleaned_data" data frame where NULL values have been omitted

library(ggplot2)

options(scipen=5)
summary(visa_data)
head(visa_data)
str(visa_data)

# Exclude the 2 odd 1 hit responses
visa_data<-subset(visa_data, CASE_STATUS == "DENIED" | CASE_STATUS == "CERTIFIED" | CASE_STATUS == "CERTIFIED-WITHDRAWN" | CASE_STATUS == "WITHDRAWN")

#Plots to visualize breakdown of features
ggplot(data=visa_data, aes(x=CASE_STATUS, fill=CASE_STATUS))+ geom_bar(alpha=0.4)+ggtitle("Petition Outcomes")+labs(x="Status", y="Count")+coord_flip()

ggplot(data=visa_data, aes(x=YEAR, fill=YEAR))+ geom_bar(alpha=0.4)+ggtitle("Petitions by Year")+labs(x="YEAR", y="Count")

ggplot(data=visa_data, aes(x=FULL_TIME_POSITION, fill=FULL_TIME_POSITION))+ geom_bar(alpha=0.4)+ggtitle("Full Vs Part Time Position")+labs(x="Yes/No Response", y="Count")+coord_flip()

plot(visa_data$YEAR, visa_data$FULL_TIME_POSITION,main ="Full vs Half Time Position Status", xlab ="Year", ylab="Yes/No Response")
plot(certified$YEAR, certified$FULL_TIME_POSITION,main ="Full vs Half Time Position: Certified Petitions", xlab ="Year", ylab="Yes/No Response")
plot(denied$YEAR, denied$FULL_TIME_POSITION,main ="Full vs Half Time Position: Denied Petitions", xlab ="Year", ylab="Yes/No Response")


#ggplot(data=visa_data, aes(x=JOB_TITLE, fill=JOB_TITLE))+ geom_bar(alpha=0.4)+ggtitle("Most Popular Jobs")+labs(x="Job Title", y="Count")+coord_flip()

#Density plot to show the CASE_STATUS response over the years
ggplot(data=cleaned_data, aes(x=YEAR, fill=CASE_STATUS))+ geom_density(alpha=0.4)+ggtitle("Yearly Petition Responses")+labs(x="Year", y="Kernel Density")
# Same plot for the Certified/Denied responses only
ggplot(data=bin_case_status, aes(x=YEAR, fill=CASE_STATUS))+ geom_density(alpha=0.4)+ggtitle("Yearly Petition Responses")+labs(x="Year", y="Kernel Density")



