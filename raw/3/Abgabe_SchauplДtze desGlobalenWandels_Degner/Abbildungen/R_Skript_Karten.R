if (!require(leaflet)){install.packages("leaflet"); library(leaflet)}
if (!require(maptools)){install.packages("maptools"); library(maptools)}
if (!require(GISTools)){install.packages("GISTools"); library(GISTools)}
if (!require(prettymapr)){install.packages("prettymapr"); library(prettymapr)}


m <- leaflet() %>% 
  addProviderTiles(providers$Esri.NatGeoWorldMap) %>%  
  addMarkers(lng=-111.64419164, lat=57.180807, label = "Alberta, Ölsandabbau", labelOptions = labelOptions(noHide = T, textOnly = T, style = list("color" = "red", "font-style" = "bolt"))) %>%
  addMarkers(lng=-125.70255696, lat=49.59294945, label = "British Columbia, Aquakultur", labelOptions = labelOptions(noHide = T, textOnly = T, style = list("color" = "red", "font-style" = "bolt")))
m

y <- leaflet() %>% 
  addProviderTiles(providers$Esri.NatGeoWorldMap) %>%  
  addPopups(lng=-111.64419164, lat=57.180807, "Alberta, Ölsandabbau", options = popupOptions(noHide = T, closeButton = FALSE, style = list("color" = "red", "font-style" = "bolt"))) %>%
  addPopups(lng=-125.70255696, lat=49.59294945, "British Columbia, Aquakultur", options = popupOptions(noHide = T, closeButton = FALSE, style = list("color" = "red", "font-style" = "bolt"))) %>%
  addScaleBar("bottomright")
y

x <- leaflet() %>% 
  addProviderTiles(providers$Esri.NatGeoWorldMap) %>%  
  addPopups(lng=-111.64419164, lat=57.180807, "Alberta, Ölsandabbau", options = popupOptions(noHide = T, closeButton = FALSE, style = list("color" = "red", "font-style" = "bolt"))) %>%
  addPopups(lng=-125.70255696, lat=49.59294945, "British Columbia, Aquakultur", options = popupOptions(noHide = T, closeButton = FALSE, style = list("color" = "red", "font-style" = "bolt"))) %>%
  addScaleBar("bottomright")
x

Alberta <- leaflet() %>%
  addProviderTiles(providers$Esri.WorldImagery) %>%
  fitBounds(-110.80741882,57.42092466,-112.13401794,56.68716243) %>%
  addScaleBar("bottomright")
Alberta

BC <- leaflet() %>%
  addProviderTiles(providers$Esri.WorldImagery) %>%
  fitBounds(-126.39654636,49.62766998,-126.4981699,49.67257164) %>%
  addScaleBar("bottomright")
BC

