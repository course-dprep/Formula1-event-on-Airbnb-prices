library(tidyverse)


filtered_australia <- read.csv("../../gen/data-preparation/output/filtered_australia.csv")


# make new dataframe to calculate average for australia
grp_avg_australia <-
  filtered_australia %>%
  group_by(event_city, date) %>%
  summarise(price = mean(price)) %>%
  arrange(date, event_city)
  
#rename column and row names
colnames(grp_avg_australia) <-  c("city", "date", "price")
grp_avg_australia$city[grp_avg_australia$city == '0'] <- 'Sydney'
grp_avg_australia$city[grp_avg_australia$city == '1'] <- 'Melbourne'



# check assumptions by plotting price over time
#plot australia
#pdf("plot_australia.pdf")
ggplot(grp_avg_australia, aes(x = date, y = price, color = factor(city), group = city )) + 
  geom_line() + scale_colour_discrete("Continents")

ggsave(filename = "../../gen/analysis/output/plot_australia.png", width = 15, height = 6, dpi = 100, units = "cm") 



