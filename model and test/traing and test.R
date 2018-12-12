library("dplyr")
#read txt file
txt_auto <- read.csv(file = "C:\\Users\\world\\Documents\\solidware_automobile\\proprocessing\\Processed_auto.csv",
                     header=TRUE)

#use only 8 features which relative to losses
target_8_data <- txt_auto[,c(2, 10,11,12,13,17,22,24,25)]

#traing model and test function
regression <- function(data,a){
  #seperate data to training and text set(8:2)
  sample_num = sample(1:nrow(target_8_data), size = round(0.2 * nrow(target_8_data)))
  sample_train <- target_8_data[sample_num,]
  sample_test <- target_8_data[-sample_num,]
  
  #train regression model with train data set
  m <- lm(normalized.losses ~ ., data = sample_train)
  
  summary(m)
  
  anova(m)
  
  sample_prediction <- predict(m, newdata = sample_test[,c(-1)], interval="prediction")
  
  sample_mse<-mean((sample_test[,1] - sample_prediction[,1])^2)
  return(sample_mse)
}
mse1 <- regression(target_8_data)
mse2 <- regression(target_8_data)
mse3 <- regression(target_8_data)
mse4 <- regression(target_8_data)
mse5 <- regression(target_8_data)

avarage_mse <- (mse1+mse2+mse3+mse4+mse4)/5
