library(fixest)
library(readr)
# load 
final <-  read_csv("../../gen/data-preparation/output/final_airbnb_dataset.csv", col_types = cols(date = col_date(format = "%Y-%m-%d")))


# filter on melbourne/sydney
australia <- c("melbourne", "sydney")
spain <- c("madrid", "barcelona")

filter_australia <- filter(final, city == australia) %>% 
filter(date > "2022-03-25") %>% 
filter(date < "2022-04-11")

filter_spain <- filter(final, city == spain) %>% 
filter(date > "2022-05-05") %>% 
filter(date < "2022-05-23")


# make new column for dummy variable
filter_australia$dummy <- ifelse(filter_australia$city == "melbourne", 1, 0)
# make new column for dummy variable formula 1 period
filter_australia$formula1 <- ifelse(filter_australia$date > "2022-04-07", 1, 0)

# make new column for dummy variable
filter_spain$dummy <- ifelse(filter_spain$city == "barcelona", 1, 0)
# make new column for dummy variable formula 1 period
filter_spain$formula1 <- ifelse(filter_spain$date > "2022-05-19", 1, 0)



##
filter_dates <- as.Date(filter_australia$date)

as.Date(as.character(filter_australia$date),format="%Y%m%d")

# Step 1
date <- seq(min(as.Date(filter_australia$date)), max(as.Date(filter_australia$date)), by = "day")

# Step 2
counter <- 1:length(date)
dates <- data.frame(counter=counter, date=date)

filter_australia$date <- as.Date(filter_australia$date) 

# Step 3
filter_australia <- filter_australia %>% inner_join(dates, by = "date")


# Estimate model 1 (Australia)
model_1 <- feols(price ~ formula1 + dummy + 
                formula1:dummy,
                 data = filter_australia,
                 cluster = ~ id)

# Estimate model 1 (Spain)
model_2 <- feols(price ~ formula1 + dummy + 
                   formula1:dummy,
                 data = filter_spain,
                 cluster = ~ id)


filter_australia_neighbourhood <- filter_australia %>% filter(neighbourhood_cleansed == "Port Phillip")


model_3 <- feols(price ~ formula1 + dummy + 
                   formula1:dummy | accommodates + counter,
                 data = filter_australia,
                 cluster = ~ id)


model_4 <- feols(price ~ formula1 + dummy + 
                   formula1:dummy | accommodates + neighbourhoods,
                 data = filter_spain,
                 cluster = ~ id)



# make output table in modelsummary 

cm <- c('(Intercept)' = 'Constant',
         'formula1'    = 'Formula 1 weekend',
        'dummy'    = 'Formula 1 city',
        'formula1:dummy' = 'Effect of formula1 difference')


models  <- list('Australia' = model_1, 
                 'Spain' =  model_2,
                'Australia confounds' = model_3,
                'Spain confounds' = model_4)
          
modelsummary(models, , coef_map = cm, stars = TRUE)

# check assumptions by plotting price over time

# average spain
grp_avg_spain<-
  filter_spain %>%
  group_by(dummy, date) %>%
  summarise(price = mean(price)) %>%
  arrange(date, dummy)
View(grp_avg)



# average australia
grp_avg_australia <-
  filter_australia %>%
  group_by(dummy, date) %>%
  summarise(price = mean(price)) %>%
  arrange(date, dummy)
View(grp_avg)



formula_1_date_melbourne = "2022-04-09"
formula_1_date_spain = "2022-05-22"

#plot spain 
ggplot(grp_avg_spain, aes(x = date, y = price, color = factor(dummy))) + 
  geom_line() + geom_vline(xintercept = week(formula_1_date_spain), col = "red") + labs()

#plot austrlia
ggplot(grp_avg_australia, aes(x = date, y = price, color = factor(dummy))) + 
  geom_line() + geom_vline(xintercept = week(formula_1_date_spain), col = "red")


