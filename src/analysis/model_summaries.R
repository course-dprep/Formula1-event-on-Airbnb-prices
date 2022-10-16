install.packages("modelsummary", repos='http://cran.us.r-project.org')
install.packages("fixest", repos='http://cran.us.r-project.org')
install.packages("funx", repos='http://cran.us.r-project.org')
install.packages("webshot", repos='http://cran.us.r-project.org')
webshot::install_phantomjs()

library(fixest)
library(tidyverse)
library(modelsummary)
library(webshot)


filtered_australia <- read.csv("../../gen/data-preparation/output/filtered_australia.csv")
filtered_spain <-  read.csv("../../gen/data-preparation/output/filtered_spain.csv")

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
modelsummary(models, coef_map = cm, stars = TRUE, output = "../../gen/analysis/output/table.png", width = 10, height = 8, dpi = 20, units = "cm")
