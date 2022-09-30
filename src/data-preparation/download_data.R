library(tidyverse)

n_max = Inf

all_listings_csv_links = c('http://data.insideairbnb.com/australia/vic/melbourne/2022-03-09/data/listings.csv.gz',  
                           'http://data.insideairbnb.com/australia/nsw/sydney/2022-03-09/data/listings.csv.gz',
                           'http://data.insideairbnb.com/spain/catalonia/barcelona/2022-03-10/data/listings.csv.gz',
                           'http://data.insideairbnb.com/spain/comunidad-de-madrid/madrid/2022-03-10/data/listings.csv.gz')


all_calendar_csv_links = c('http://data.insideairbnb.com/australia/vic/melbourne/2022-03-09/data/calendar.csv.gz',
                           'http://data.insideairbnb.com/australia/nsw/sydney/2022-03-09/data/calendar.csv.gz',
                           'http://data.insideairbnb.com/spain/catalonia/barcelona/2022-03-10/data/calendar.csv.gz',
                           'http://data.insideairbnb.com/spain/comunidad-de-madrid/madrid/2022-03-10/data/calendar.csv.gz')

# make list of the dataframes
all_calendar_list <- lapply(all_calendar_csv_links, read_csv, n_max = n_max)
all_listings_list <- lapply(all_listings_csv_links, read_csv, n_max = n_max)


# combine all calendar dataframes
all_calendar <-  bind_rows(cbind(city='madrid', all_calendar_list[[4]]), 
                           cbind(city='barcelona',all_calendar_list[[3]]),
                           cbind(city='melbourne',all_calendar_list[[1]]),
                           cbind(city='sydney',all_calendar_list[[2]]))


# combine all listing dataframes
all_listings <-  bind_rows(cbind(city='madrid', all_listings_list[[4]]), 
                           cbind(city='barcelona',all_listings_list[[3]]),
                           cbind(city='melbourne',all_listings_list[[1]]),
                           cbind(city='sydney',all_listings_list[[2]]))


# write as csv
write.csv(all_calendar,"../../data/all_calendar.csv")
write.csv(all_listings,"../../data/all_listings.csv")






