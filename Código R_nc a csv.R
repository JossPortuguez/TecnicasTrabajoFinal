setwd("D:/Joss/Ciclo_5/Tecnicas_Programacion/Trabajofinal")
rm(list = ls())
#install.packages("raster")
#install.packages("ncdf4")
library(raster)
library(ncdf4)
long_lat <- read.csv("datos_coor.csv", header = T)
raster_pp <- raster::brick("data.nc")
sp::coordinates(long_lat) <- ~XX+YY
raster::projection(long_lat) <- raster::projection(raster_pp)
points_long_lat <- raster::extract(raster_pp[[1]], long_lat, cellnumbers = T)[,1]
data_long_lat <- t(raster_pp[points_long_lat])
colnames(data_long_lat) <- as.character(long_lat$NN)

save.image("D:/Joss/Ciclo_5/Tecnicas_Programacion/Trabajofinal/preci_can1.csv")

write.csv(data_long_lat,"preci_can1.csv", quote = F)