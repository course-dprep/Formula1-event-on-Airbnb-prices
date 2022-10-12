library(dplyr)

cleaned_airbnb_data <- read.csv("../../gen/data-preparation/temp/cleaned_airbnb_data.csv")

# Delete automatic generated column "X"
cleaned_airbnb_data <- subset(cleaned_airbnb_data, select = -c(X))

# remove the outliers
quartiles <- quantile(cleaned_airbnb_data$price, probs=c(.25, .75), na.rm = TRUE)
IQR <- IQR(cleaned_airbnb_data$price, na.rm = TRUE)

Lower <- quartiles[1] - 1.5*IQR
Upper <- quartiles[2] + 1.5*IQR 

cleaned_airbnb_data_without_outliers <- cleaned_airbnb_data %>% filter(price > Lower & price < Upper)

write.csv(cleaned_airbnb_data_without_outliers, "../../gen/data-preparation/temp/airbnb_dataset_without_outliers.csv")

