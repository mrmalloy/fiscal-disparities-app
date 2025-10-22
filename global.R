library(shiny)
library(leaflet)
library(plotly)
library(terra)

base <- readRDS('data/allFD_spatial.RDS') %>%
  sf::st_as_sf(crs = '')

pal1 <- colorNumeric("PuOr", domain = base$total_tb_comind_withfd)