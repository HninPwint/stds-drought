load("data/unemployment_water.RData")
View(water_unemployment)

nrow(water_unemployment) # 21489 obs 4 variable
describe(water_unemployment) # will skewness useful ??
View(water_unemployment)

# water_group_by_terr <- water_unemployment %>% 
#   group_by(territory_sa4) 
# View(water_group_by_terr)

sum(is.na(water_unemployment$waterlevel_mean)) # 12053
water_missing_value_percentage = sum(is.na(water_unemployment$waterlevel_mean))/nrow(water_unemployment) 
water_missing_value_percentage  # % 56

gg_miss_var(water_unemployment)
matrixplot(water_unemployment, sortby = 2)

