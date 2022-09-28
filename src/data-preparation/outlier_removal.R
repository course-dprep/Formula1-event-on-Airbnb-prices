library(dplyr)

cleaned_airbnb_data <- read.csv("cleaned_airbnb_data.csv")

# Delete automatic generated column "X"
cleaned_airbnb_data <- subset(cleaned_airbnb_data, select = -c(X))

# deleting all prices = 0

# cleaned_airbnb_data <- cleaned_airbnb_data %>% filter(price < ???)


# remove the outliers
quartiles <- quantile(cleaned_airbnb_data$price, probs=c(.25, .75), na.rm = FALSE)
IQR <- IQR(cleaned_airbnb_data$price)

Lower <- quartiles[1] - 1.5*IQR
Upper <- quartiles[2] + 1.5*IQR 

cleaned_airbnb_data_without_outliers <- cleaned_airbnb_data %>% filter(price > Lower & price < Upper)


# NA's all columns
cleaned_airbnb_data_without_outliers %>% 
  summarise_all(~sum(is.na(.)))

write.csv(cleaned_airbnb_data_without_outliers, "final_airbnb_dataset.csv")

