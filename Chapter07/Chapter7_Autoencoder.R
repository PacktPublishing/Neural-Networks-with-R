#################################################################
### Chapter 7 - Neural Networks with R - Use cases      #########
### Autoencoder using H2O on a movie dataset            #########
### URL - https://grouplens.org/datasets/movielens/     #########
#################################################################

library("h2o")

setwd ("c://R")
#Load the training dataset of movies
movies=read.csv ( "movies.csv", header=TRUE)
head(movies)

model=h2o.deeplearning(2:3, 
                       training_frame=as.h2o(movies),
                       hidden=c(2), 
                       autoencoder = T, 
                       activation="Tanh")

summary(model)

features=h2o.deepfeatures(model,
                         as.h2o(movies),
                         layer=1)

d=as.matrix(features[1:10,])
labels=as.vector(movies[1:10,2])
plot(d,pch=17)
text(d,labels,pos=3)
#################################################################