# H1B Visa Petition Data Project
### Project Summary
This project was created using the dataset called H-1B Visa Petitions 2011-2016, provided by Kaggle.com. The two main objectives of my analysis were to explore the association rules present in this dataset, and also to train a model to accurately predict whether a visa petition would be "Certified" or "Denied". The majority of the modeling, analysis, and data cleaning was completed with R (in R Studio). The association rule mining was implimented with the Arules library, and the predictive models were linear and radial kernel SVMs from the e1071 library. 

### Data Cleaning Methods
 There were several steps necessary to process and clean the H-1B visa dataset: 

* I checked for the presence of missing values, using the Mice library from R. Due to the fact that the data I was working with was so large and predominantly catagorical and the null values accounted for such a small sum of the data, I decided not to impute the values. The oringinal data set had roughly 3 million records. After omitting the null values, I was left with 2.8 million records. 
* I converted all of the sting values to upper-case in order make the data consistant. This was particularly improtant for the feature columns, "JOB_TITLE" and "SOC_NAME" due to thier inconsistent naming conventions. 
* I created subsets of the data to be used for various modeling tasks: 
  * I created a dataset wherein the case status was only "CERTIFIED" or "DEINIED"**. This was so that I could use a binary response variable for training the predictive models. This was also helpful for the associating rule mining because there was such a low lift response from the other catagories (for example, one of the responses was 1/3m). 
  * I also created one subset containing only "CERTIFIED" and one subset containing only "DENIED" for visualization creation. This also helped me determine whether trends or patterns where present.

###### **There were two binary response data sets: the first was take from the entire population of all CERTIFIED and DENIED; the second was a random sampling from the CERTIFIED and DENIED (This helped trim the data set to a size that managable on my machine).
### Analysis Methods

For analysis, I created bar charts, projection trends, kernel density plots, and petition outcomes. I trained Both radial and linear kernel model support vector machines, using the binary response dataset. I performed association rule mining on the binary dataset as well as both single response datasets. I evaluated statistics on the visualizations generated to decide which model best fit the results.*

###### *viualizations of the analysis are included in the attached document. 

### Results/Conclusions
Overall, the model accuracy of the SVM's was pretty low (~65%), and the derived association rules were not terribly insightful. The weak results from my analysis prompted me to look into the source data that the Kaggle competition datset was derived from, and it appears that the data collected by the US Department of Labor contains many more fields than the subset provided by Kaggle. I believe that including some of the features from the origional dataset would greatly improve the performance of my predictive models. The trends for the volume of petitions submitted over time conform well to a linear model (based on the R^2 reuslt), adding confidence to the projections for future cases; however, there were not indicators present in the data that pointed to the root cause of why the CERTIFIED and DENIED responses changed over time as the data showed, so perhaps the original data collected by the US Department of Labor would provide more insights.  

## References
##### Naribole, S. (2017). H-1B Visa Petitions 2011-2016. Retrieved from: https://www.kaggle.com/nsharan/h-1b-visa
##### Chiu, Y. (2016). R for Data Science Cookbook. Packt Publishing. Retrieved form: http://proquest.safaribooksonline.com.dml.regis.edu/book/programming/r/9781784390815
##### US Department of Labor. (2017). OFLC Performance Data. Retrieved from: https://www.foreignlaborcert.doleta.gov/performancedata.cfm 
##### US Department of Labor. (2017). H-1B iCert LCA. Retrieved from: https://www.foreignlaborcert.doleta.gov/docs/Performance_Data/Disclosure/FY15-FY16/H-1B_FY16_Record_Layout.pdf
