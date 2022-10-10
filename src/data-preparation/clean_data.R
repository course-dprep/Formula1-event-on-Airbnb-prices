library(dplyr)
library(readr)
# Load merged data 
merged_airbnb_data <- read_csv("../../gen/data-preparation/temp/merged_airbnb_data.csv", col_types = cols(price.x = col_number()))

# Delete automatic generated column "...1" and duplicate columns
merged_airbnb_data <- subset(merged_airbnb_data, select = -c(...1, city.y, price.y, minimum_nights.y, maximum_nights.y))

# Adjusting column names 
colnames(all_calendar)[which(names(all_calendar) == "city.x")] <- "city"
colnames(all_calendar)[which(names(all_calendar) == "price.x")] <- "price"
colnames(all_calendar)[which(names(all_calendar) == "minimum_nights.x")] <- "minimum_nights"
colnames(all_calendar)[which(names(all_calendar) == "maximum_nights.x")] <- "maximum_nights"

# Save cleaned data
write.csv(merged_airbnb_data, "../../gen/data-preparation/temp/cleaned_airbnb_data.csv")
