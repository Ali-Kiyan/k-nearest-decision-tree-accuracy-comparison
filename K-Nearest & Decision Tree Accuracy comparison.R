occupancy_test <- read.table("datatraining.txt", sep = ",")
occupancy_test_f <- occupancy_test[,c(2, 3, 4, 5, 7)]
#occupancy_data_f$Occupancy <- ifelse (occupancy_data_f$Occupancy==1, "YES": "NO")
occupancy_test_f$knn_result <- NA
length_test <- nrow(occupancy_test_f)
k <- 5
for(j in 1:length_test)
{
    temp <- occupancy_test_f$Temperature[j]  
    hum  <- occupancy_test_f$Humidity[j]
    lit  <- occupancy_test_f$Light[j]
    co2  <- occupancy_test_f$CO2[j]
    length <- nrow(occupancy_test_f)
    occupancy_test_f$euclidean_distance <- NA
  
for(i in 1:length)
{

}
       occupancy_test_f<- occupancy_test_f[order(occupancy_test_f$euclidean_distance),]
}
