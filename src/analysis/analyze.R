library(fixest)

# load 
final <-  read.csv("../data-preparation/final_airbnb_dataset.csv")

# filter on melbourne/sydney
australia <- c("melbourne", "sydney")
spain <- c("madrid", "barcelona")

filter_australia <- filter(final, city == australia) %>% 
filter(date > "2022-03-25") %>% 
filter(date < "2022-04-11")

filter_spain <-  filter(final, city == spain)
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



# make output table in modelsummary 

models  <- list('Australia' = model_1, 
                 'Spain' =  model_2)
          

modelsummary(models)






