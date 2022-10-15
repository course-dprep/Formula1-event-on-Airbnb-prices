library(tidyverse)

filtered_spain <- read.csv("../../gen/data-preparation/output/filtered_spain.csv")


# make new dataframe to calculate average for spain
grp_avg_spain <-
  filtered_spain %>%
  group_by(event_city, date) %>%
  summarise(price = mean(price)) %>%
  arrange(date, event_city)



# check assumptions by plotting price over time
#plot spain 

ggplot(grp_avg_spain, aes(x = date, y = price, color = factor(event_city), group = event_city )) + 
  geom_line() 

ggsave(filename = "../../gen/analysis/output/plot_spain.png",  width = 15, height = 6, dpi = 100, units = "cm")
