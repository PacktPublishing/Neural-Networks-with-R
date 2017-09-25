##########################################################################
#################Chapter 3 - Deep Learning with H2O and R################# 
##########################################################################

library(h2o)

c1=h2o.init(max_mem_size = "2G", 
      nthreads = 2, 
      ip = "localhost", 
      port = 54321)

data(iris)
summary(iris)

iris_d1 <- h2o.deeplearning(1:4,5,
              as.h2o(iris),hidden=c(5,5),
              export_weights_and_biases=T)
iris_d1
plot(iris_d1)

h2o.weights(iris_d1, matrix_id=1)
h2o.weights(iris_d1, matrix_id=2)
h2o.weights(iris_d1, matrix_id=3)
h2o.biases(iris_d1, vector_id=1)
h2o.biases(iris_d1, vector_id=2)
h2o.biases(iris_d1, vector_id=3)

#plot weights connecting `Sepal.Length` to first hidden neurons
plot(as.data.frame(h2o.weights(iris_d1, matrix_id=1))[,1])

##########################################################################