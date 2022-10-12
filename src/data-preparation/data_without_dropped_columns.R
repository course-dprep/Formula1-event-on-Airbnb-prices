library(dplyr)
# load all listings csv's
listings_melbourne <- read.csv("../../data/listings_melbourne.csv")
listings_sydney <- read.csv("../../data/listings_sydney.csv")
listings_barcelona <- read.csv("../../data/listings_barcelona.csv")
listings_madrid <- read.csv("../../data/listings_madrid.csv")

# load all calendar csv's
calendar_melbourne <- read.csv("../../data/calendar_melbourne.csv")
calendar_sydney <- read.csv("../../data/calendar_sydney.csv")
calendar_barcelona <- read.csv("../../data/calendar_barcelona.csv")
calendar_madrid <- read.csv("../../data/calendar_madrid.csv")

# Filter datasets on date (delete all after June)
calendar_melbourne <- calendar_melbourne %>% filter(date > as.Date('2022-03-25') & date < as.Date('2022-06-05'))
calendar_sydney <- calendar_sydney %>% filter(date > as.Date('2022-03-25') & date < as.Date('2022-06-05'))
calendar_barcelona <- calendar_barcelona %>% filter(date > as.Date('2022-03-25') & date < as.Date('2022-06-05'))
calendar_madrid <- calendar_madrid %>% filter(date > as.Date('2022-03-25') & date < as.Date('2022-06-05'))

# Make list of unnecessary columns
drop_calendar <-  c("available", "adjusted_price")
drop_listings <- c("listing_url", "scrape_id", "last_scraped", "description", "neighborhood_overview", "picture_url", "host_url", "host_name", "host_since", "host_location", "host_about", "host_response_time", "host_response_rate", "host_acceptance_rate", "host_thumbnail_url", "host_picture_url", "host_neighborhood", "host_listings_count", "host_total_listings_count", "host_verification", "host_has_profile_pic", "host_identity_verified", "latitude", "longitude", "bathrooms", "bathrooms_text", "minimum_minimum_nights", "maximum_minimum_nights", "minimum_maximum_nights", "maximum_maximum_nights", "minimum_nights_avg", "maximum_nights_avg", "calendar_updated", "availability_30", "availability_60", "availability_90", "availability_365", "calendar_last_scraped", "number_of_reviews_ltm", "number_of_reviews_l30d", "first_review", "last_review", "license", "instant_bookable", "calculated_host_listings_count", "calculated_host_listings_count_entire_homes", "calculated_host_listings_count_private_rooms", "calculated_host_listings_count_shared_rooms", "host_is_superhost", "host_neighborhood", "host_verifications", "bedrooms", "beds", "amenities", "minimum_nights_avg_ntm", "maximum_nights_avg_ntm", "has_availability", "number_of_reviews", "review_scores_accuracy", "review_scores_cleanliness", "review_scores_checkin", "review_scores_communication", "review_scores_location", "review_scores_value", "reviews_per_month")

# Drop unnecessary columns from all listings datasets
cleaned_list_mel <- listings_melbourne[ , !(names(listings_melbourne)%in% drop_listings)]
cleaned_list_syd <- listings_sydney[ , !(names(listings_sydney)%in% drop_listings)]
cleaned_list_bar <- listings_barcelona[ , !(names(listings_barcelona)%in% drop_listings)]
cleaned_list_mad <- listings_madrid[ , !(names(listings_madrid)%in% drop_listings)]

# Drop unnecessary columns from all calendar datasets
cleaned_cal_mel <- calendar_melbourne[ , !(names(calendar_melbourne)%in% drop_calendar)]
cleaned_cal_syd <- calendar_sydney[ , !(names(calendar_sydney)%in% drop_calendar)]
cleaned_cal_bar <- calendar_barcelona[ , !(names(calendar_barcelona)%in% drop_calendar)]
cleaned_cal_mad <- calendar_madrid[ , !(names(calendar_madrid)%in% drop_calendar)]

# Save cleaned datasets
write.csv(cleaned_list_mel, file = "../../gen/data-preparation/temp/cleaned_list_mel.csv")
write.csv(cleaned_list_syd, file = "../../gen/data-preparation/temp/cleaned_list_syd.csv")
write.csv(cleaned_list_bar, file = "../../gen/data-preparation/temp/cleaned_list_bar.csv")
write.csv(cleaned_list_mad, file = "../../gen/data-preparation/temp/cleaned_list_mad.csv")
write.csv(cleaned_cal_mel, file = "../../gen/data-preparation/temp/cleaned_cal_mel.csv")
write.csv(cleaned_cal_syd, file = "../../gen/data-preparation/temp/cleaned_cal_syd.csv")
write.csv(cleaned_cal_bar, file = "../../gen/data-preparation/temp/cleaned_cal_bar.csv")
write.csv(cleaned_cal_mad, file = "../../gen/data-preparation/temp/cleaned_cal_mad.csv")


