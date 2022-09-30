library(dplyr)
library(readr)
# Load merged data 
merged_airbnb_data <- read_csv("../../gen/data-preparation/temp/merged_airbnb_data.csv", col_types = cols(price.x = col_number()))

# Delete automatic generated column "...1"
merged_airbnb_data <- subset(merged_airbnb_data, select = -c(...1))

# Adjusting column names 
colnames(merged_airbnb_data)[1] <- "city"
colnames(merged_airbnb_data)[5] <- "price"
colnames(merged_airbnb_data)[7] <- "minimum_nights"
colnames(merged_airbnb_data)[8] <- "maximum_nights"

# Filter on date (delete all after June)(listings dataset)
all_data <- merged_airbnb_data %>% filter(between(date, as.Date('2022-03-25'), as.Date('2022-06-05')))

# Drop unnecessary columns
drop <- c("listing_url", "scrape_id", "last_scraped", "description", "neighborhood_overview", "picture_url", "host_url", "host_name", "host_since", "host_location", "host_about", "host_response_time", "host_response_rate", "host_acceptance_rate", "host_thumbnail_url", "host_picture_url", "host_neighborhood", "host_listings_count", "host_total_listings_count", "host_verification", "host_has_profile_pic", "host_identity_verified", "latitude", "longitude", "bathrooms", "bathrooms_text", "minimum_minimum_nights", "maximum_minimum_nights", "minimum_maximum_nights", "maximum_maximum_nights", "minimum_nights_avg", "maximum_nights_avg", "calendar_updated", "availability_30", "availability_60", "availability_90", "availability_365", "calendar_last_scraped", "number_of_reviews_ltm", "number_of_reviews_l30d", "first_review", "last_review", "license", "instant_bookable", "calculated_host_listings_count", "calculated_host_listings_count_entire_homes", "calculated_host_listings_count_private_rooms", "calculated_host_listings_count_shared_rooms", "city.y", "price.y", "minimum_nights.y", "maximum_nights.y", "available", "adjusted_price", "host_is_superhost", "host_neighborhood", "host_verifications", "bedrooms", "beds", "amenities", "minimum_nights_avg_ntm", "maximum_nights_avg_ntm", "has_availability", "number_of_reviews", "review_scores_accuracy", "review_scores_cleanliness", "review_scores_checkin", "review_scores_communication", "review_scores_location", "review_scores_value", "reviews_per_month")
data_without_dropped_columns <- all_data[ , !(names(all_data) %in% drop)]

# Save cleaned data
write.csv(data_without_dropped_columns, "../../gen/data-preparation/temp/cleaned_airbnb_data.csv")
