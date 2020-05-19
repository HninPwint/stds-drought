library(ISLR)
library(dlookr)
library(dplyr)
library(tidyverse)

# Load Data
load("data/unemployment_evap.RData")
nrow(evap_unemployment) # 21489 obs 4 variable
describe(evap_unemployment) # will skewness useful ??
View(evap_unemployment)

group_by_terr <- evap_unemployment %>% 
  group_by(territory_sa4) 
View(group_by_terr)

# Check the count and % of rows with Missing Evaporation Values
sum(!is.na(evap_unemployment$evap_mean)) # 15791 null, #5698 not null
evap_missing_value_percentage = sum(is.na(evap_unemployment$evap_mean))/nrow(evap_unemployment)  # 15791 , 73%
evap_missing_value_percentage
map(evap_unemployment, ~ sum(is.na(.))) # evap,stationid,lat,long,elv,stationname - 15791

load("data/unemployment.RData")
head(unemployment)


# What are the terriorities with missing data
terr_with_missing_evap_data <- evap_unemployment %>% 
  filter(!is.na(evap_unemployment$evap_mean))

View(unique(terr_with_missing_evap_data))

terr_with_missing_evap_data %>% group_by(territory_sa4) %>% summarise(count=n()) # 87 Unique Terriorites

gg_miss_var(evap_unemployment)
matrixplot(evap_unemployment, sortby = 2)
View(evap_unemployment)
