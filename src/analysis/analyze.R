library(fixest)
library(readr)
# load 
final_airbnb_dataset <-  read_csv("../../gen/data-preparation/output/final_airbnb_dataset_airbnb_dataset.csv", col_types = cols(date = col_date(format = "%Y-%m-%d")))


# filter on melbourne/sydney
australia <- c("melbourne", "sydney")
spain <- c("madrid", "barcelona")

filtered_australia <- filter(final_airbnb_dataset_airbnb_dataset, city == australia) %>% 
filter(date > "2022-03-25") %>% 
filter(date < "2022-04-11")

filtered_spain <- filter(final_airbnb_dataset, city == spain) %>% 
filter(date > "2022-05-05") %>% 
filter(date < "2022-05-23")


# make new column for event_city variable 
filtered_australia$event_city <- ifelse(filtered_australia$city == "melbourne", 1, 0)
# make new column for event_city variable formula 1 period
filtered_australia$formula1 <- ifelse(filtered_australia$date > "2022-04-07", 1, 0)

# make new column for event_city variable
filtered_spain$event_city <- ifelse(filtered_spain$city == "barcelona", 1, 0)
# make new column for event_city variable formula 1 period
filtered_spain$formula1 <- ifelse(filtered_spain$date > "2022-05-19", 1, 0)

# Step 1
date <- seq(min(as.Date(filtered_australia$date)), max(as.Date(filtered_australia$date)), by = "day")

# Step 2
counter <- 1:length(date)
dates <- data.frame(counter=counter, date=date)

filtered_australia$date <- as.Date(filtered_australia$date) 

# Step 3
filtered_australia <- filtered_australia %>% inner_join(dates, by = "date")

################

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



# make new dataframe to calculate average for spain
grp_avg_spain<-
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
modelsummary(models, , coef_map = cm, stars = TRUE)

# check assumptions by plotting price over time



#define intervention dates for formula 1 event
formula_1_date_melbourne = "2022-04-09"
formula_1_date_spain = "2022-05-22"



#plot spain 
ggplot(grp_avg_spain, aes(x = date, y = price, color = factor(event_city))) + 
  geom_line() + geom_vline(xintercept = day(formula_1_date_spain), col = "red") + labs()

#plot australia
ggplot(grp_avg_australia, aes(x = date, y = price, color = factor(event_city))) + 
  geom_line() + geom_vline(xintercept = day(formula_1_date_spain), col = "red")








