install.packages("tidyverse", repos='http://cran.us.r-project.org')
install.packages("dplyr", repos='http://cran.us.r-project.org')
install.packages("readr", repos='http://cran.us.r-project.org')
library(tidyverse)

# download all listings files
download.file(url = 'http://data.insideairbnb.com/australia/vic/melbourne/2022-03-09/data/listings.csv.gz', destfile = '../../data/listings_melbourne.csv')
download.file(url = 'http://data.insideairbnb.com/australia/nsw/sydney/2022-03-09/data/listings.csv.gz', destfile = '../../data/listings_sydney.csv')
download.file(url = 'http://data.insideairbnb.com/spain/catalonia/barcelona/2022-03-10/data/listings.csv.gz', destfile = '../../data/listings_barcelona.csv')
download.file(url = 'http://data.insideairbnb.com/spain/comunidad-de-madrid/madrid/2022-03-10/data/listings.csv.gz', destfile = '../../data/listings_madrid.csv')

# download all calendar files
download.file(url = 'http://data.insideairbnb.com/australia/vic/melbourne/2022-03-09/data/calendar.csv.gz', destfile = '../../data/calendar_melbourne.csv')
download.file(url = 'http://data.insideairbnb.com/australia/nsw/sydney/2022-03-09/data/calendar.csv.gz', destfile = '../../data/calendar_sydney.csv')
download.file(url = 'http://data.insideairbnb.com/spain/catalonia/barcelona/2022-03-10/data/calendar.csv.gz', destfile = '../../data/calendar_barcelona.csv')
download.file(url = 'http://data.insideairbnb.com/spain/comunidad-de-madrid/madrid/2022-03-10/data/calendar.csv.gz', destfile = '../../data/calendar_madrid.csv')







