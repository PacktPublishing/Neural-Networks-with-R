#########################################################################
###Chapter 1 - Introduction to Neural Networks - using R ################
###Simple R program to build, train and test neural Networks#############
#########################################################################
#Choose the libraries to use
library("neuralnet")
 
#Set working directory for the training data
setwd("C:/R")
getwd()
 
#Read the input file
mydata=read.csv('Squares.csv',sep=",",header=TRUE)
mydata
attach(mydata)
names(mydata)
 
#Train the model based on output from input
model=neuralnet(formula = Output~Input, 
                data = mydata, 
                hidden=10, 
                threshold=0.01 )
print(model)
 
#Lets plot and see the layers
plot(model)
 
#Check the data - actual and predicted
final_output=cbind (Input, Output, 
                    as.data.frame(model$net.result) )
colnames(final_output) = c("Input", "Expected Output", 
                           "Neural Net Output" )
print(final_output)
#########################################################################