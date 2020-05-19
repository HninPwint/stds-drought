library(ISLR)
library(dlookr)
library(dplyr)
library(tidyverse)
library(VIM)
library(gridExtra)
library(naniar)

# Load Data
load("data/HPT/precp_sa4.RData")
nrow(precp_sa4) #82026
random_check_precp_sa4 <- precp_sa4 %>% 
  filter(territory_sa4 == "Victoria - North West")
random_check_precp_sa4
sum(is.na(precp_sa4$precp)) # no NULL


load("data/unemployment.RData")
unique(unemployment$territory_sa4)


load("data/unemployment_precp.RData")
nrow(precp_unemployment) # 21489 obs, 4 variables
# 10 variables and 787631 obs
describe(precp_unemployment)

group_by_terr <- precp_unemployment %>% 
  group_by(territory_sa4) 
View(group_by_terr)

# Check the count and % of rows with Missing Precp Values
sum(is.na(precp_unemployment$precp_mean)) # not null 10338, # 11151 null
precp_missing_value_percentage = sum(is.na(precp_unemployment$precp_mean))/nrow(precp_unemployment)  # 11151 , 52%
precp_missing_value_percentage
map(precp_unemployment, ~sum(is.na(.))) # precp,stationid,lat,long,elv,stationname - 11151

head(precp_unemployment)
# What are the terriorities with missing data
rows_with_missing_values <- precp_unemployment[is.na(precp_unemployment$precp_mean),]
unique(rows_with_missing_values$territory_sa4) #54 terriorities
terr_with_missing_rainfall_data %>% group_by(territory_sa4) %>% summarise(count=n()) # 54 Unique Terriorites

# set.seed(2)
# prep_missing_data <- precp_unemployment  %>% 
#   mutate(prep_miss = ifelse(precp_mean >1, precp_mean, NA),
#     precp_mean = ifelse(is.na(prep_miss), precp_mean, NA),
#     territory_sa4_miss = ifelse(is.na(precp_mean), territory_sa4, NA))
# 
# head(prep_missing_data)
# 
# grid.arrange(
#   ggplot(prep_missing_data, aes(territory_sa4, precp_mean)) +
#     geom_point(size=4, alpha=0.6) +
#     geom_point(aes(territory_sa4, prep_miss ), col="red", alpha=0.6)
# )

gg_miss_var(precp_unemployment)
matrixplot(precp_unemployment, sortby = 2)



