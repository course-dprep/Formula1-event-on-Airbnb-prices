library(dplyr)
# Load datasets into R 
all_listings <- read.csv("all_listings.csv")
all_calendar <- read.csv("all_calendar.csv")

# Delete automatic generated column "X"
all_listings <- subset(all_listings, select = -c(X))
all_calendar <- subset(all_calendar, select = -c(X))

# Change column name of "listing_id" to "id"
colnames(all_calendar)[2] <- "id"

# Merge on id
merged_airbnb_data <- full_join(all_calendar, all_listings, "id")

# Save merged data
write.csv(merged_airbnb_data, "merged_airbnb_data.csv")