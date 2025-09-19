#Paktete installieren und einladen
install.packages("pals")
install.packages("RColorBrewer")
library(leaflet)
library(sp)
library(sf)
library(dplyr)
library(pals)
library(RColorBrewer)

#Laufwerk bestimmen
setwd("H:/Documents/Wetterdaten Risk Map")


#Daten einladen und bearbeiten
Spain <- st_read("H:/Documents/Wetterdaten Risk Map/Shape/NUTS_RG_01M_2016_4326_LEVL_3.shp")
Bezirke <- read.csv2("H:/Documents/Wetterdaten Risk Map/Daten.csv")
Note <- read.csv2("H:/Documents/Wetterdaten Risk Map/Note.csv")
Spain_3 <- filter(Spain, CNTR_CODE  == "ES")
Spain_merge <- merge(Spain_3,Bezirke, by.x = "FID", by.y = "Zahl")


#Farbpaletten erstellen
pal_red <- colorQuantile(
  palette = pals::brewer.ylorrd(5),
  domain = Spain_merge$Note, n=5)

pal_legende <- colorNumeric("YlOrRd",Spain_merge$Note)

#Beschriftung erstellen
label_spain <- sprintf("<strong>%s</strong><br/>%g ", Spain_merge$NUTS_NAME, Spain_merge$Note) %>% 
  lapply(htmltools::HTML)  

#Karte erstellen

leaflet(Spain_merge) %>%
  addProviderTiles(providers$Esri.WorldImagery)%>%
  addPolygons(color = ~pal_red(Spain_merge$Note), fillColor = ~pal_red(Spain_merge$Note), fillOpacity = .8, highlightOptions = highlightOptions(bringToFront = TRUE, color = "black"), label = label_spain, labelOptions = labelOptions(textsize = "13px")) %>%
  addLegend(position = "bottomright",title = "Vulnerabilitätswert", colors = pals::brewer.ylorrd(5), labels = Note$Vulnerabilitaet)


#Die Karte kann interaktiv genutzt werden