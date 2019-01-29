getwd()
dir.create("D:/RStudio/R study/20190115")
setwd("D:/RStudio/R study/20190115")

#import shapefile into R
library (sf)

ward86 <- st_read("data/ward1986.shp")
ward86_utm1 <- st_transform(ward86,"+proj=utm +zone=16 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0")
ward86_utm <- st_transform(ward86,32616)  #epsg
ward86_stateplane <- st_transform(ward86,3435)  #state plane
ward86_alaska <- st_transform(ward86,3338)

st_crs(ward86)
st_crs(ward86_utm)
st_crs(ward86_stateplane)
st_crs(ward86_alaska)

plot(ward86)
plot(ward86_utm)
plot(ward86_stateplane)
plot(ward86_alaska)



