library(readr)
library(tidyverse)
# load 
final_airbnb_dataset <-  read_csv("../../gen/data-preparation/output/final_airbnb_dataset.csv", col_types = cols(date = col_date(format = "%Y-%m-%d")))

# specify on melbourne/sydney
australia <- c("melbourne", "sydney")
spain <- c("madrid", "barcelona")

filtered_australia <- filter(final_airbnb_dataset, city == australia) %>% 
  filter(date > "2022-03-25") %>% 
  filter(date < "2022-04-11")

filtered_spain <- filter(final_airbnb_dataset, city == spain) %>% 
  filter(date > "2022-05-05") %>% 
  filter(date < "2022-05-23")

write.csv(filtered_spain, "../../gen/data-preparation/output/filtered_spain.csv")
write.csv(filtered_australia, "../../gen/data-preparation/output/filtered_australia.csv")