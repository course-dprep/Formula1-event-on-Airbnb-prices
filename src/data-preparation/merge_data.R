library(dplyr)
# Load datasets into R 
all_listings <- read.csv("../../gen/data-preparation/temp/all_listings.csv")
all_calendar <- read.csv("../../gen/data-preparation/temp/all_calendar.csv")

# Delete automatic generated column "X"
all_listings <- subset(all_listings, select = -c(X, X.1))
all_calendar <- subset(all_calendar, select = -c(X, X.1))


# Change column name of "listing_id" to "id"
View(all_calendar)
colnames(all_calendar)[which(names(all_calendar) == "listing_id")] <- "id"

# Merge on id
merged_airbnb_data <- full_join(all_calendar, all_listings, "id")

# Save merged data
write.csv(merged_airbnb_data, "../../gen/data-preparation/temp/merged_airbnb_data.csv")
