# Multiple Linear Regression
# Multiple Linear Regression is a statistical technique that uses several explanatory variables to predict the outcome of a response variable. 
# The goal is to model the relationship between the explanatory and response variables by fitting a linear equation to observed data. 
# The steps to perform multiple linear regression are almost identical to those of simple linear regression. 
# The difference comes in when calculating the coefficients in the linear equation.
# 
# Mathematically, it can be represented as:
# y = b0 + b1*x1 + b2*x2 + ... + bn*xn + E
# where:
  
# y is the dependent variable.
# b0 is the y-intercept.
# b1, b2, ..., bn are the coefficients of the independent variables x1, x2, ..., xn.
# E is the error term.
# The coefficients b1, b2, ..., bn represent the change in the dependent variable y for a one-unit change in the respective independent variables.

# The Trees Dataset
# The trees dataset is a built-in dataset in the R programming language 
# that measures the girth, height, and volume of timber in 31 felled black cherry trees. 
# The dataset contains three variables: 
# Girth (the tree diameter in inches), 
# Height (the tree height in feet), and 
# Volume (the timber volume in cubic feet).
# 
# Girth: It is the diameter of the tree (in inches) at 4 ft 6 in above the ground.
# Height: It is the height of the tree (in feet).
# Volume: It is the volume of timber in the tree (in cubic feet), and it's the variable we are interested in predicting.
# 
# This dataset is often used to demonstrate regression analysis in R.



# Multiple Linear Regression with the Trees Dataset
# When we perform a Multiple Linear Regression analysis using the trees dataset, 
# we're trying to create a model that can predict the Volume of a tree given its Girth and Height.
# 
# This can be useful in the timber industry, where understanding the potential volume yield of a tree 
# based on its measurable characteristics can assist in planning and decision-making.
# 
# Our regression model will use Volume as the dependent variable, 
# and Girth and Height as independent variables.
# 
# In the next steps, we'll load the trees dataset, perform exploratory data analysis, 
# create the regression model, and interpret the results, 
# with the goal of predicting a tree's timber volume based on its girth and height.

# Volume = b0 + b1*Girth + b2*Height + E
# 
# Where:
#   
# Volume is the dependent variable we want to predict.
# Girth and Height are the independent variables.
# b0 is the y-intercept, i.e., the value of Volume when both Girth and Height are 0.
# b1 is the coefficient for Girth, representing the change in Volume for a one-unit change in Girth, assuming Height is held constant.
# b2 is the coefficient for Height, representing the change in Volume for a one-unit change in Height, assuming Girth is held constant.
# E is the error term, representing the difference between the actual and predicted values of Volume. 
# It captures the variability in Volume that cannot be explained by Girth and Height.


#Load the Dataset
data(trees)

#Look at the first few rows of the dataset
head(trees)

# Fit the multiple linear regression model
model <- lm(Volume ~ Girth + Height, data = trees)

#show the model 
#Volume = b0 + b1*Girth + b2*Height + E
print(model)
summary(model)

#show the coefficients only
coef(model)

#Store the coefficients into variables
b0=model$coefficients[[1]]
b1=model$coefficients[[2]]
b2=model$coefficients[[3]]

# Calculate volume in cubic feet for a Girth of 12 inches and Height of 65 feet
# Using the above model
Girth=12
Height=65

# predict manually using Volume = b0 + b1*Girth + b2*Height + E
nuvolume=b0+b1*Girth+b2*Height
print(nuvolume)

# use predict command for the same
newtree=data.frame(Girth=12,Height=65)
newvolume=predict(model,newtree)
print(newvolume)

#Exercise01
#create a multiple linear model for mtcars dataset
#model <- lm(mpg~disp+hp+wt, data = mtcars)

#Exercise02
# Let us see the correlation matrix
# M<-cor(trees)
# # Install corrplot from Tools>Install Packages
# library(corrplot)
# corrplot(M, method="circle")
# corrplot(M, method="pie")
# corrplot(M, method="color")
# corrplot(M, method="number")

