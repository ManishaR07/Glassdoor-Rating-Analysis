
#Loading packages and libraries
library(readxl)
library(dplyr)
library(tidyverse)
library(caret)
install.packages("car")
library(car)

#Reading the data from excel file
hrdata_gs<-read_excel("Glassdoor Ratings_Work.xlsx")

#Exploring the data
str(hrdata_gs)

#Using Multiple Regression Model
model1<-lm(formula=Recommendation~., data=hrdata_gs)

#Summarizing the model
summary(model4)

##Checking assumptions - MLR
##Assumption 1 Checking linearity
plot(x=hrdata_gs)

##Assumption 2 Checking significant outliers
boxplot(hrdata_gs) ##Few outliers in Culture, Senior Mgmt, D&I

##Assumption 3 - Checking for multicollinearity
vif_values <- vif(model1)

#create horizontal bar chart to display each VIF value
barplot(vif_values, main = "VIF Values", horiz = TRUE, col = "steelblue")

#add vertical line at 5
abline(v = 5, lwd = 3, lty = 2)

#Creating plot
# set the graphical parameter
par(mfrow = c(2, 2))

# run diagnostics
plot(model1)

# Build a model excluding the Culture snd Senior Mgmt variable due to high multicollinearity
model2 <- lm(Recommendation ~ Career_opportunities+CandB+ WLB+DandI , data = hrdata_gs)

summary(model2)

#checking for multicollinearity
vif_values2<- vif(model2)

#create horizontal bar chart to display each VIF value
barplot(vif_values2, main = "VIF Values", horiz = TRUE, col = "steelblue")

#add vertical line at 5
abline(v = 5, lwd = 3, lty = 2)

#Creating plot
# set the graphical parameter
par(mfrow = c(2, 2))

# run diagnostics
plot(model2)

## In the Residuals vs Leverage Plot observation #53 lies closest to the border of Cook’s distance, but it doesn’t fall outside of the dashed line. 
## This means there are not any influential points in our regression model.

##From the Residuals vs fitted Plot we see some heteroscedasticity so we use use Goldfeld Quandt test to check for heteroscedasticity
install.packages("lmtest")
library(lmtest)
gqtest(model2, order.by = ~Career_opportunities+CandB+ WLB+DandI, data = hrdata_gs, fraction = 18)

##As the p-value is not less than 0.05 we fail to reject the null hypothesis that there is no heteroscedasticity in the data