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

ggsave(filename = "../../gen/analysis/output/plot_spain.pdf", width = 10, height = 8, dpi = 150, units = "in") 
