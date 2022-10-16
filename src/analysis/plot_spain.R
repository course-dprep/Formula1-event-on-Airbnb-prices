library(tidyverse)

filtered_spain <- read.csv("../../gen/data-preparation/output/filtered_spain.csv")


# make new dataframe to calculate average for spain
grp_avg_spain <-
  filtered_spain %>%
  group_by(event_city, date) %>%
  summarise(price = mean(price)) %>%
  arrange(date, event_city)


#rename column and row names
colnames(grp_avg_spain) <-  c("city", "date", "price")
grp_avg_spain$city[grp_avg_spain$city == '0'] <- 'Madrid'
grp_avg_spain$city[grp_avg_spain$city == '1'] <- 'Barcelona'

# check assumptions by plotting price over time
#plot spain 

ggplot(grp_avg_spain, aes(x = date, y = price, color = factor(city), group = city )) + 
  geom_line() + scale_colour_discrete("City")

ggsave(filename = "../../gen/analysis/output/plot_spain.png",  width = 15, height = 6, dpi = 100, units = "cm")
