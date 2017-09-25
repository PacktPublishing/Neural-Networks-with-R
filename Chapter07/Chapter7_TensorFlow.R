######################################################################
###Chapter 7 - Introduction to Neural Networks - using R    ##########
###Getting started with TensorFlow and Keras on R           ##########
######################################################################
install.packages("tensorflow") ## Required one time
install_tensorflow() ## This can also be used to install TensorFlow
library(tensorflow)

sess = tf$Session()
hello <- tf$constant('Hello, TensorFlow!')
sess$run(hello)

##Install Keras for R
install.packages("devtools")
devtools::install_github("rstudio/keras")
library(keras)

##Check if Keras is installed correctly
##Load the MNIST dataset
data=dataset_mnist()
