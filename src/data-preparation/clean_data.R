library(dplyr)
library(readr)
# Load merged data 
merged_airbnb_data <- read_csv("../../gen/data-preparation/temp/merged_airbnb_data.csv", col_types = cols(price.x = col_number()))

# Delete automatic generated column "...1" and duplicate columns
merged_airbnb_data <- subset(merged_airbnb_data, select = -c(...1, city.y, price.y, minimum_nights.y, maximum_nights.y))

# Adjusting column names 
colnames(merged_airbnb_data)[which(names(merged_airbnb_data) == "city.x")] <- "city"
colnames(merged_airbnb_data)[which(names(merged_airbnb_data) == "price.x")] <- "price"
colnames(merged_airbnb_data)[which(names(merged_airbnb_data) == "minimum_nights.x")] <- "minimum_nights"
colnames(merged_airbnb_data)[which(names(merged_airbnb_data) == "maximum_nights.x")] <- "maximum_nights"

# Save cleaned data
write.csv(merged_airbnb_data, "../../gen/data-preparation/temp/cleaned_airbnb_data.csv")
