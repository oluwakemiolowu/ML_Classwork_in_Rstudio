#############################################
# Machine Learning with R                   #
# Date: 23rd, October 2022                  #
# Data Science Mar'2022 Class               #
#############################################

# Import libraries
#library(mlbench)
install.packages("mlbench")
install.packages("caret")
library(mlbench)
library(caret)
# Load the BostonHousing dataset
# Time to build our Linear Regression Model
Model <- train(
  medv ~.,
  data = Training_Dataset,
  na.action = na.omit,
  preProcess = c("scale","center"),
  method = "lm",
  trControl =trainControl(method = "none")
  
)load(BostonHousing)
data("BostonHousing")
# visualise the data
#hist(BostonHousing$age)

# Split the dataset using stratify random sampling
myData <- createDataPartition(BostonHousing$medv, p =0.8, list = FALSE)
Training_Dataset <- BostonHousing[myData,]
Testing_Dataset <- BostonHousing[-myData,] 



# it's time to predict using our model
Model.Training <- predict(Model, Training_Dataset)
Model.testing <- predict(Model, Testing_Dataset)


#Model summary
summary(Model)
