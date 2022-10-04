library(dplyr)

# load all cleaned listings csv's containing only the necessary columns
listings_melbourne <- read.csv("../../gen/data-preparation/temp/cleaned_list_mel.csv")
listings_sydney <- read.csv("../../gen/data-preparation/temp/cleaned_list_syd.csv")
listings_barcelona <- read.csv("../../gen/data-preparation/temp/cleaned_list_bar.csv")
listings_madrid <- read.csv("../../gen/data-preparation/temp/cleaned_list_mad.csv")

# load all calendar csv's containing only the necessary columns
calendar_melbourne <- read.csv("../../gen/data-preparation/temp/cleaned_cal_mel.csv")
calendar_sydney <- read.csv("../../gen/data-preparation/temp/cleaned_cal_syd.csv")
calendar_barcelona <- read.csv("../../gen/data-preparation/temp/cleaned_cal_bar.csv")
calendar_madrid <- read.csv("../../gen/data-preparation/temp/cleaned_cal_mad.csv")

# combine all listing dataframes
all_listings <-  bind_rows(cbind(city='madrid', listings_madrid), 
                           cbind(city='barcelona',listings_barcelona),
                           cbind(city='melbourne',listings_melbourne),
                           cbind(city='sydney',listings_sydney))

# combine all calendar dataframes
all_calendar <-  bind_rows(cbind(city='madrid', calendar_madrid), 
                           cbind(city='barcelona',calendar_barcelona),
                           cbind(city='melbourne',calendar_melbourne),
                           cbind(city='sydney',calendar_sydney))




# write as csv
write.csv(all_calendar,"../../gen/data-preparation/temp/all_calendar.csv")
write.csv(all_listings,"../../gen/data-preparation/temp/all_listings.csv")
