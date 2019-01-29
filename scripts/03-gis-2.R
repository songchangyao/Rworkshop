
library(sf)
ward98 <- st_read("data/ward1998.shp")
ward98 <- st_transform(ward98,32616)

centriods <- st_centroid(ward98)
plot(ward98)

library(ggplot2)
ggplot(data = ward98)+
  geom_sf()

ggplot(data = centriods)+
  geom_sf()

ggplot()+
  geom_sf(data = ward98,fill="green")+
  geom_sf(data = centriods,color = "red")


ggplot()+
  geom_sf(data = ward98,aes(fill=COUNT))+       ##DATA变量
  geom_sf(data = centriods,color = "red")

water <- st_read("data/Waterways.geojson")
water <- st_transform(water,32616)

ggplot()+
  geom_sf(data=water)                           ##data置于上下括号皆可

library(dplyr)
View(water)
names(water)
arrange(water,desc(shape_len))
unique(water$name)

water_clean <- filter(water,name!="LAKE MICHIGAN")

ggplot()+
  geom_sf(data=ward98) +
  geom_sf(data=water_clean,color="blue") 

?st_intersects
?st_intersection

intersects <- st_intersects(ward98,water_clean)
water_wards <- filter(ward98,lengths(intersects)>0)

ggplot()+
  geom_sf(data=ward98) +
  geom_sf(data=water_wards,fill="lightblue") +
  geom_sf(data=water_clean,color="blue")


ggsave("doc/figs/map.png")


