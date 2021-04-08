library(rgdal)
library(ggplot2)
library(foreign)

capa_estados <-readOGR("La ruta en donde guardaste la carpeta conjunto de datos", layer= "areas_geoestadisticas_estatales")
#por ejemplo: capa_estados <-readOGR("D:/mapas/conjunto_de_datos", layer= "areas_geoestadisticas_estatales")

class(capa_estados) 

#names(capa_estados), sirve para ver que se usa la CVE_ENT
#Mapa simple
ggplot() +  
  geom_polygon(data=capa_estados, aes(x=long, y=lat, group=group))

#Mapa con los contornos de los estados y etiquetas. 
ggplot() +  
  geom_polygon(data=capa_estados, aes(x=long, y=lat, group=group), 
               fill="white", color="black") +
labs(title="Mapa de México",   
     subtitle="Subtítulo", 
     caption="Elaboración propia. \n Datos geográficos: INEGI 2016.") 


#Solo el mapa y se ajusta el largo y ancho a los máx y min de latitud y longitud
ggplot() +  
  geom_polygon(data=capa_estados, aes(x=long, y=lat, group=group), 
               fill="white", color="black") +
  expand_limits(x = capa_estados_df$long, y = capa_estados_df$lat)+
  labs(title="Mapa de México",   
       subtitle="Subtítulo", 
       caption="Elaboración propia. \n Datos geográficos: INEGI 2016.") +
  theme_void()
