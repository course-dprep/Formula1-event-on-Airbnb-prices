library(readr)
library(tidyverse)
# load 
final_airbnb_dataset <-  read_csv("../../gen/data-preparation/temp/airbnb_dataset_without_outliers.csv", col_types = cols(date = col_date(format = "%Y-%m-%d")))

# specify on melbourne/sydney
australia <- c("melbourne", "sydney")
spain <- c("madrid", "barcelona")

filtered_australia <- filter(final_airbnb_dataset, city == australia) %>% 
  filter(date > "2022-03-25") %>% 
  filter(date < "2022-04-11")

# make new column for event_city variable 
filtered_australia$event_city <- ifelse(filtered_australia$city == "melbourne", 1, 0)
# make new column for event_city variable formula 1 period
filtered_australia$formula1 <- ifelse(filtered_australia$date > "2022-04-07", 1, 0)

filtered_spain <- filter(final_airbnb_dataset, city == spain) %>% 
  filter(date > "2022-05-05") %>% 
  filter(date < "2022-05-23")


# make new column for event_city variable
filtered_spain$event_city <- ifelse(filtered_spain$city == "barcelona", 1, 0)

# make new column for event_city variable formula 1 period
filtered_spain$formula1 <- ifelse(filtered_spain$date > "2022-05-19", 1, 0)



write.csv(filtered_spain, "../../gen/data-preparation/output/filtered_spain.csv")
write.csv(filtered_australia, "../../gen/data-preparation/output/filtered_australia.csv")