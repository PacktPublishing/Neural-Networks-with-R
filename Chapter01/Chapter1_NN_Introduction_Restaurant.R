########################################################################
##Chapter 1 - Introduction to Neural Networks - using R ################
###Simple R program to build, train and test neural networks ###########
### Classification based on 3 inputs and 1 categorical output ##########
########################################################################

###Choose the libraries to use
library(NeuralNetTools)
library(nnet)
 
###Set working directory for the training data
setwd("C:/R")
getwd()
 
###Read the input file
mydata=read.csv('RestaurantTips.csv',sep=",",header=TRUE)
mydata
attach(mydata)
names(mydata)
 
##Train the model based on output from input
model=nnet(CustomerWillTip~Service+Ambience+Food, 
           data=mydata, 
           size =5, 
           rang=0.1, 
           decay=5e-2, 
           maxit=5000)
print(model)
plotnet(model)
garson(model)
########################################################################