library(readr)
Filtered_F1_Data <- read_csv("Filtered_F1_Data.csv", col_types = cols(price.x = col_number()))
View(Filtered_F1_Data)
colnames(Filtered_F1_Data)[2] <- "city"
colnames(Filtered_F1_Data)[5] <- "price"
colnames(Filtered_F1_Data)[6] <- "minimum_nights"
colnames(Filtered_F1_Data)[7] <- "maximum_nights"

#deleting all prices = 0
library(dplyr)
Filtered_F1_Data <- Filtered_F1_Data %>% filter(price < ???)

#plots
boxplot(Filtered_F1_Data$price)

#mean and SD
mean_price <- mean(Filtered_F1_Data_without_outliers$price)
sd_price <- sd(Filtered_F1_Data$price)


#outlier removing
quartiles <- quantile(Filtered_F1_Data$price, probs=c(.25, .75), na.rm = FALSE)
IQR <- IQR(Filtered_F1_Data$price)

Lower <- quartiles[1] - 1.5*IQR
Upper <- quartiles[2] + 1.5*IQR 

Filtered_F1_Data_without_outliers <- Filtered_F1_Data %>% filter(price > Lower & price < Upper)

length(Filtered_F1_Data_without_outliers)

#boxplot without outliers
boxplot(Filtered_F1_Data_without_outliers$price)

#NA's all columns
library(dplyr)
Filtered_F1_Data_without_outliers %>% 
  summarise_all(~sum(is.na(.)))

