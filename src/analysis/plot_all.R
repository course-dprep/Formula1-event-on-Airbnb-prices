library(tidyverse)
library(fixest)
library(readr)
library(modelsummary)
# load the data
filtered_spain <- read.csv("../../gen/data-preparation/output/filtered_spain.csv")
filtered_australia <- read.csv("../../gen/data-preparation/output/filtered_australia.csv")

# make new dataframe to calculate average for spain
grp_avg_spain <-
  filtered_spain %>%
  group_by(event_city, date) %>%
  summarise(price = mean(price)) %>%
  arrange(date, event_city)


# make new dataframe to calculate average for australia
grp_avg_australia <-
  filtered_australia %>%
  group_by(event_city, date) %>%
  summarise(price = mean(price)) %>%
  arrange(date, event_city)

#plot spain 
ggplot(grp_avg_spain, aes(x = date, y = price, color = factor(event_city), group = event_city )) + 
  geom_line() 

ggsave(filename = "../../gen/analysis/output/plot_spain.pdf") 


# check assumptions by plotting price over time
#plot spain 

ggplot(grp_avg_spain, aes(x = date, y = price, color = factor(event_city), group = event_city )) + 
  geom_line() 




# check assumptions by plotting price over time
#plot australia
#pdf("plot_australia.pdf")
ggplot(grp_avg_australia, aes(x = date, y = price, color = factor(event_city), group = event_city )) + 
  geom_line() 

ggsave(filename = "../../gen/analysis/output/plot_australia.pdf", width = 10, height = 8, dpi = 150, units = "in") 


# Estimate (Australia)
model_1 <- feols(price ~ formula1 + event_city + 
                   formula1:event_city,
                 data = filtered_australia,
                 cluster = ~ id)

# Estimate (Spain) 
model_2 <- feols(price ~ formula1 + event_city + 
                   formula1:event_city,
                 data = filtered_spain,
                 cluster = ~ id)

# Estimate (Spain) with fixed effects 
model_3 <- feols(price ~ formula1 + event_city + 
                   formula1:event_city | accommodates,
                 data = filtered_australia,
                 cluster = ~ id)

# Estimate (Australia) with fixed effects 
model_4 <- feols(price ~ formula1 + event_city + 
                   formula1:event_city | accommodates,
                 data = filtered_spain,
                 cluster = ~ id)

# make output table in modelsummary 

cm <- c('(Intercept)' = 'Constant',
        'formula1'    = 'Formula 1 weekend',
        'event_city'    = 'Formula 1 city',
        'formula1:event_city' = 'Effect of formula1 difference')


models  <- list('Australia' = model_1, 
                'Spain' =  model_2,
                'Australia confounds' = model_3,
                'Spain confounds' = model_4)

#table with models
modelsummary(models, coef_map = cm, stars = TRUE, output = "../../gen/analysis/output/table.html")

