library(arules)
library(arulesViz)

#Copy visa_data for use in association rule work

ar_data <- bin_case_status


# Convert to factor type
ar_data$CASE_STATUS <- as.factor(ar_data$CASE_STATUS)
ar_data$EMPLOYER_NAME <- as.factor(ar_data$EMPLOYER_NAME)
ar_data$SOC_NAME <- as.factor(ar_data$SOC_NAME)
ar_data$JOB_TITLE <- as.factor(ar_data$JOB_TITLE)
ar_data$FULL_TIME_POSITION <- as.factor(ar_data$FULL_TIME_POSITION)
ar_data$PREVAILING_WAGE <- as.factor(ar_data$PREVAILING_WAGE)
ar_data$YEAR <- as.factor(ar_data$YEAR)
ar_data$WORKSITE <- as.factor(ar_data$WORKSITE)
#remove JOB_TITLE, lon and lat columns because redundant/will confirm WORKSITE in rules
ar_data$lon <- NULL
ar_data$lat <- NULL
ar_data$SOC_NAME<-NULL

# Create transaction object, and set apriori support and confidence intervals 
visas<- as(ar_data, "transactions")
rules<- apriori(visas, parameter=list(support=0.005, confidence=0.80))

#Create histogram 
inspect(head(sort(rules, by="lift"),10))
plot(rules)
head(quality(rules))
plot(rules, measure=c("support","lift"), shading="confidence")
plot(rules, shading="order", control=list(main ="Two-key plot"))

# Interactive plot 
#sel = plot(rules, measure=c("support","lift"), shading="confidence", interactive=TRUE)

# Create a subset of rules with confidence > 0.80
subrules= rules[quality(rules)$confidence > 0.8]


#Visualizing the association rules by antecedent and the consequent
plot(subrules, method="matrix", measure="lift")

# Other misc. plots
plot(subrules, method="matrix", measure="lift", control=list(reorder=TRUE))
plot(subrules, method="matrix3D", measure="lift")
plot(subrules, method="matrix", measure=c("lift","confidence"), control = list(reorder=TRUE))
plot(subrules, method="matrix", measure=c("lift", "confidence"))

# Plots after Reducing Subrules
itemFrequencyPlot(visas, support = 0.1, cex.names=0.8)
subrules_30<-head(sort(rules, by="lift"), 30)
plot(subrules_30, method="graph")
plot(subrules_30, method="graph", control=list(type="items"))

oneRule = sample(rules, 1)
inspect(oneRule)

#############################################################################################
#Association Rules for Denied Case Status
#
############################################################################################

denied_data <- denied


# Convert to factor type
denied_data$CASE_STATUS <- as.factor(denied_data$CASE_STATUS)
denied_data$EMPLOYER_NAME <- as.factor(denied_data$EMPLOYER_NAME)
denied_data$SOC_NAME <- as.factor(denied_data$SOC_NAME)
denied_data$JOB_TITLE <- as.factor(denied_data$JOB_TITLE)
denied_data$FULL_TIME_POSITION <- as.factor(denied_data$FULL_TIME_POSITION)
denied_data$PREVAILING_WAGE <- as.factor(denied_data$PREVAILING_WAGE)
denied_data$YEAR <- as.factor(denied_data$YEAR)
denied_data$WORKSITE <- as.factor(denied_data$WORKSITE)
#remove JOB_TITLE, lon and lat columns because redundant/will confirm WORKSITE in rules
denied_data$lon <- NULL
denied_data$lat <- NULL
denied_data$CASE_STATUS <-NULL

# Create transaction object, and set apriori support and confidence intervals 
visas<- as(denied_data, "transactions")
rules<- apriori(visas, parameter=list(support=0.005, confidence=0.80))

#Create histogram 
inspect(head(sort(rules, by="lift"),10))
plot(rules)
head(quality(rules))
plot(rules, measure=c("support","lift"), shading="confidence")
plot(rules, shading="order", control=list(main ="Two-key plot"))

# Interactive plot 
#sel = plot(rules, measure=c("support","lift"), shading="confidence", interactive=TRUE)

# Create a subset of rules with confidence > 0.80
subrules= rules[quality(rules)$confidence > 0.8]


#Visualizing the association rules by antecedent and the consequent
plot(subrules, method="matrix", measure="lift")

# Other misc. plots
plot(subrules, method="matrix", measure="lift", control=list(reorder=TRUE))
plot(subrules, method="matrix3D", measure="lift")
plot(subrules, method="matrix", measure=c("lift","confidence"), control = list(reorder=TRUE))
plot(subrules, method="matrix", measure=c("lift", "confidence"))

# Plots after Reducing Subrules
itemFrequencyPlot(visas, support = 0.1, cex.names=0.8)
subrules_30<-head(sort(rules, by="lift"), 30)
plot(subrules_30, method="graph")
plot(subrules_30, method="graph", control=list(type="items"))

oneRule = sample(rules, 1)
inspect(oneRule)
###############################################################################
#Association Rules for Certified Case Status
#
################################################################################
certified_data <- certified


# Convert to factor type
certified_data$CASE_STATUS <- as.factor(certified_data$CASE_STATUS)
certified_data$EMPLOYER_NAME <- as.factor(certified_data$EMPLOYER_NAME)
certified_data$SOC_NAME <- as.factor(certified_data$SOC_NAME)
certified_data$JOB_TITLE <- as.factor(certified_data$JOB_TITLE)
certified_data$FULL_TIME_POSITION <- as.factor(certified_data$FULL_TIME_POSITION)
certified_data$PREVAILING_WAGE <- as.factor(certified_data$PREVAILING_WAGE)
certified_data$YEAR <- as.factor(certified_data$YEAR)
certified_data$WORKSITE <- as.factor(certified_data$WORKSITE)
#remove JOB_TITLE, lon and lat columns because redundant/will confirm WORKSITE in rules
certified_data$lon <- NULL
certified_data$lat <- NULL
certified_data$CASE_STATUS <-NULL

# Create transaction object, and set apriori support and confidence intervals 
visas<- as(certified_data, "transactions")
rules<- apriori(visas, parameter=list(support=0.005, confidence=0.80))

#Create histogram 
inspect(head(sort(rules, by="lift"),10))
plot(rules)
head(quality(rules))
plot(rules, measure=c("support","lift"), shading="confidence")
plot(rules, shading="order", control=list(main ="Two-key plot"))

# Interactive plot 
#sel = plot(rules, measure=c("support","lift"), shading="confidence", interactive=TRUE)

# Create a subset of rules with confidence > 0.80
subrules= rules[quality(rules)$confidence > 0.8]


#Visualizing the association rules by antecedent and the consequent
plot(subrules, method="matrix", measure="lift")

# Other misc. plots
plot(subrules, method="matrix", measure="lift", control=list(reorder=TRUE))
plot(subrules, method="matrix3D", measure="lift")
plot(subrules, method="matrix", measure=c("lift","confidence"), control = list(reorder=TRUE))
plot(subrules, method="matrix", measure=c("lift", "confidence"))

# Plots after Reducing Subrules
itemFrequencyPlot(visas, support = 0.1, cex.names=0.8)
subrules_30<-head(sort(rules, by="lift"), 30)
plot(subrules_30, method="graph")
plot(subrules_30, method="graph", control=list(type="items"))

oneRule = sample(rules, 1)
inspect(oneRule)

