##Use SVM to predict case_status response variable
library(e1071)
library(klaR)
library(caret)
visa_svm <- pred_samples

##Move response variable to the end of the cols
visa_svm$RESPONSE<-visa_svm$CASE_STATUS

#Remove redundant variables
visa_svm$CASE_STATUS<-NULL
visa_svm$lat<-NULL
visa_svm$lon<-NULL
visa_svm$SOC_NAME<-NULL


visa_svm$EMPLOYER_NAME<-as.factor(visa_svm$EMPLOYER_NAME)
#visa_svm$SOC_NAME<-as.factor(visa_svm$SOC_NAME)
visa_svm$FULL_TIME_POSITION<-as.factor(visa_svm$FULL_TIME_POSITION)
visa_svm$WORKSITE<-as.factor(visa_svm$WORKSITE)
visa_svm$PREVAILING_WAGE<-as.factor(visa_svm$PREVAILING_WAGE)
visa_svm$YEAR<-as.factor(visa_svm$YEAR)
visa_svm$RESPONSE<-as.factor(visa_svm$RESPONSE)
#visa_svm$lon<-as.factor(visa_svm$lon)
#visa_svm$lat<-as.factor(visa_svm$lat)
visa_svm$JOB_TITLE<-as.factor(visa_svm$JOB_TITLE)

##Divide data into test and train set
set.seed(1234)
ind=sample(2, nrow(visa_svm),replace=TRUE, prob =c(0.7, 0.3))
trainSet<-visa_svm[ind==1,]
testSet<-visa_svm[ind==2,]

###########build model with radial kernal##########################################
rad_svm_model<- svm(RESPONSE ~.,data=trainSet, kernel = "radial", cost=1,gamma = 1/ncol(trainSet))

summary(rad_svm_model)

rad_svm_pred<-predict(rad_svm_model, testSet[,!names(testSet)%in% c("RESPONSE")])
rad_svm_table<-table(rad_svm_pred, testSet$RESPONSE)
rad_svm_table
confusionMatrix(rad_svm_table)
################################################################################

######Build SVM with linear kernal###############################################

lin_svm_model<- svm(RESPONSE ~.,data=trainSet, kernel = "linear", cost=1,gamma = 1/ncol(trainSet))

summary(lin_svm_model)

lin_svm_pred<-predict(lin_svm_model, testSet[,!names(testSet)%in% c("RESPONSE")])
lin_svm_table<-table(lin_svm_pred, testSet$RESPONSE)
lin_svm_table
confusionMatrix(lin_svm_table)
##########################################################################################