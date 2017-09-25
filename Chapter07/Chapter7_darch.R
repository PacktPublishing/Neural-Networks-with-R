######################################################################
###Chapter 7 - Neural Networks with R                        #########
###Breast Cancer Detection using darch package               #########
######################################################################

library("mlbench")
library("darch")

data(BreastCancer)
summary(BreastCancer)

data_cleaned <- na.omit(BreastCancer) 
summary(data_cleaned)

model <- darch(Class ~ ., data_cleaned,layers = c(10, 10, 1),
        darch.numEpochs = 50, darch.stopClassErr = 0, retainData = T)

plot(model)

predictions <- predict(model, newdata = data_cleaned, type = "class")
cat(paste("Incorrect classifications:", sum(predictions != data_cleaned[,11])))
table(predictions,data_cleaned[,11])

library(gmodels)
CrossTable(x = data_cleaned$Class, y = predictions,
           prop.chisq=FALSE)
######################################################################