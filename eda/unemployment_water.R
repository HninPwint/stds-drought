load("data/unemployment_water.RData")
<<<<<<< HEAD
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

=======

load("data/HPT/water_sa4.RData")

head(water_unemployment)
unique(water_sa4$territory_sa4)

split(water_unemployment, water_unemployment$territory_sa4)[2]

Adld_cnh <- split(water_unemployment, water_unemployment$territory_sa4)[2]
Adld_cnh <- data.frame()
for (i in 1:5) {
  df <- rbind(df, as.data.frame(Adld_cnh[[i]]))
}
df1_5 <- as.data.frame(df)

names(Adld_cnh)[names(Adld_cnh) == 'Adelaide...Central.and.Hills.unemployment_rate'] <- "unemployment.rate"
names(Adld_cnh)[names(Adld_cnh) == 'Adelaide...Central.and.Hills.date'] <- "date"
names(Adld_cnh)[names(Adld_cnh) == 'Adelaide...Central.and.Hills.waterlevel_mean'] <- "waterlevel.mean"

ggplot(data=Adld_cnh, aes(x=waterlevel.mean,y=unemployment.rate)) + geom_point()

cor(Adld_cnh$unemployment.rate, Adld_cnh$date)

slm <- lm(unemployment.rate~waterlevel.mean, data = Adld_cnh)

which.max(Adld_cnh$waterlevel.mean)
Adld_cnh <- Adld_cnh[-c(144),]

ggplot(data = df1_5) + 
  geom_point(mapping = aes(x = waterlevel_mean, y = unemployment_rate)) + 
  facet_wrap(~ territory_sa4, nrow=2)
>>>>>>> 9e1463b86c7489536b36bfb8c2c3f309a5b1ea27
