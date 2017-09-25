#################################################################
### Chapter 7 - Neural Networks with R - Use cases      #########
### Handwritten digit recognition through MNIST dataset #########
#################################################################

library("h2o")

h2o.init(nthreads=-1,max_mem_size="3G")

setwd ("c://R")

train_mnist=read.csv("mnist_train_100.csv", header=FALSE)
attach(train_mnist)
names(train_mnist)

test_mnist=read.csv("mnist_test_10.csv", header=FALSE)
attach(test_mnist)
names(test_mnist)

m = matrix(unlist(train_mnist[10,-1]), 
           nrow = 28, 
           byrow = TRUE)

image(m,col=grey.colors(255))

rotate = function(x) t(apply(x, 2, rev)) 

image(rotate(m),col=grey.colors(255))

par(mfrow=c(2,3))
lapply(1:6, 
       function(x) image(
         rotate(matrix(unlist(train_mnist[x,-1]),
                       nrow = 28, 
                       byrow = TRUE)),
         col=grey.colors(255),
         xlab=train_mnist[x,1]
       )
)

par(mfrow=c(1,1))

str(train_mnist)

x=2:785
y=1

table(train_mnist[,y])

model=h2o.deeplearning(x,
                       y,
                       as.h2o(train_mnist),
                       model_id="MNIST_deeplearning",
                       seed=405,
                       activation="RectifierWithDropout",
                       l1=0.00001,
                       input_dropout_ratio=0.2,
                       classification_stop = -1,
                       epochs=2000
                       )

summary(model)

h2o.scoreHistory(model)

preds=h2o.performance(model, 
                      as.h2o(test_mnist))

newdata = h2o.predict(model, 
                   as.h2o(test_mnist))

predictions = cbind(as.data.frame(seq(1,10)),
                    test_mnist[,1],
                    as.data.frame(newdata[,1]))

names(predictions) = c("Number","Actual","Predicted")

as.matrix(predictions)
#################################################################