#Load the Dataset
data(trees)

#Look at the first few rows of the dataset
head(trees)

#Scatter Plot of Girth vs Volume
plot(trees$Girth,trees$Volume)

#Linear Regression 
lm(Volume ~ Girth,data = trees)

#Store the output into result variable
lm(Volume ~ Girth,data = trees)->result

#Check the summary of the output stored 
summary(result)

# Call line shows the same code line
# Residuals shows the distance between 
# regression line & actual data point
# Assumption of linear regression model: 
# residuals are normally distributed

# Ideally median of residuals = 0 
# & even distribution of max, min, 1Q & 3Q

#You can draw a histogram
hist(result$residuals)
# Can see a nearly normal distribution.

# Next: Study the Coefficients box

# Intercept is where the line cuts the Y axis ie. when Girth =0
# This Intercept value c = -36.9435 ie. -ve Y

# The Girth Coefficient (m) is the slope of the line 
# ie. if Girth changes by 1 unit then how many units will Volume change
# In this case Slope is 5.0659

# Now we have the linear eqution y = mx+c
# ie. Volume = 5.0659Girth - 36.9435
# We can use equation to predict any Volume given Girth 

# Look at the Pr(>|t|) values for Intercept & Girth
# This is the p value ie Significance for Null Hypothesis

# The Null Hypothesis for Intercept is Intercept = 0. 
# With p<<0.05 we can reject the Null ie. accept there is an intercept

# The Null Hypothesis for Girth is slope m = 0. 
# With p<<0.05 we can reject the Null ie. accept there is a non zero slope
# Or we can say Girth is a significant influencer of Volume

# Next look at Residual Standard Error
# Smaller this number more accurate the model
# And Multiple R Square value shows how much of Volume is explained by Girth
# Girth can explain 93.53% of Volume - thats significant!!

# Last: look at the p value of the F Statistic << p=0.05
# This means we can reject Null that there is no relation between Girth & Volume

# To show the regression line on the scatter plot
plot(trees$Girth,trees$Volume)
abline(result)

#Using the model for manual prediction -36.9435+5.0659*X

-36.9435+5.0659*11
-36.9435+5.0659*12
-36.9435+5.0659*13

#To predict, use dataframe and store the new values
ngirth<-data.frame(Girth=c(11,12,13))

#Use predict function predict(model,dataframe)
predict(result,ngirth)

#See the new volumes predicted

#Exercise: Create a linear model for cars dataset

