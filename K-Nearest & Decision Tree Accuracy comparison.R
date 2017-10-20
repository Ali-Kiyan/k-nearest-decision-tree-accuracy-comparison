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
  
  occupancy_test_f$euclidean_distance[i] = sqrt(
    (occupancy_test_f$Temperature[i]-temp)^2 +
      (occupancy_test_f$Humidity[i]-hum)^2 +
      (occupancy_test_f$Light[i]-lit)^2 +
      (occupancy_test_f$CO2[i]-co2)^2 
  )
}
       occupancy_test_f<- occupancy_test_f[order(occupancy_test_f$euclidean_distance),]
       #if occupancy was set
       Class1 <- sum(occupancy_test_f$Occupancy[1:k]==1)
       if(Class1>k/2)
       {
         print("The query point belongs to class 1")
         occupancy_test_f$knn_result[j] <- 1
       }
  
       else
       {
         print("The query belongs to class 0")
         occupancy_test_f$knn_result[j]<- 0
         
       }  
}
correct <- 0 
for (l in 1:length_test)
{
   if(occupancy_test_f[l,5]==occupancy_test_f[l,6])
   {
     correct = correct+1 
   }
}
}