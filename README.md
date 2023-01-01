# Glassdoor-Rating-Analysis

Project Objective - 

Glassdoor ratings of 100 companies across varied sectors have been analysed across factors like 
- Career Management
- Compensation & Benefit
- Culture
- Senior Management
- Work Life Balance
- Diversity & Inclusion
These factors have been analyzed to see which of these factors have significant impact on Employee Net Promotor Score for organizations. Employee Net Promoter Score is calculated
from rating given to Recommend a Friend factor.

METHODOLOGY
Inferential Analysis - We run a Multiple Regression analysis with target variable - Recommend a Friend and Independent Variables being all the other factors. And then we calculate 
VIF to check for muticollinearity in factors. We find that Culture and Senior Management have VIF of >5 so we drop these two factors and run the regression analysis again

RESULTS
We find that all the other independent variables have a significant impact on the Independent Variable


