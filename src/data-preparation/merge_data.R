library(dplyr)
# Load datasets into R 
all_listings <- read.csv("all_listings.csv")
all_calendar <- read.csv("all_calendar.csv")

colnames(all_calendar)[2] <- "id"
# Merge on id
merged_airbnb_data <- full_join(all_calendar, all_listings, "id")

# Save merged data
write.csv(merged_airbnb_data, "merged_airbnb_data.csv")