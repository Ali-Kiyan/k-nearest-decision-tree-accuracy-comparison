occupancy_test <- read.table("datatraining.txt", sep = ",")
occupancy_test_f <- occupancy_test[,c(2, 3, 4, 5, 7)]
occupancy_test_f$Occupancyf <- as.factor(occupancy_test_f$Occupancy)
library(party)
occupancy_tree <- ctree(Occupancyf~Temperature+Humidity+Light+CO2, occupancy_test_f)
test_predict <- table(predict(occupancy_tree, newdata= validate), validate$Occupancyf) 
accuracy <- sum(diag(test_predict))/sum(test_predict)

