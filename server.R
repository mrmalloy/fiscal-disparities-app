server <- function(input, output, session){

  
  
output$map <- renderLeaflet(
  
  leaflet() %>%
    addProviderTiles(provider = "CartoDB.PositronNoLabels", 
                     options = tileOptions(minZoom = 8,
                                           maxZoom = 16)) %>%
    addProviderTiles(provider = "CartoDB.PositronOnlyLabels", 
                     options = providerTileOptions(pane = "markerPane"))
  
)

output$tab <- renderUI({
    tabsetPanel(
          tabPanel("Summary Map",
                   tags$head(tags$style(type = "text/css", "#map {height:80vh !important;}")),
                   leafletOutput("map"),
                   absolutePanel(top = 50, right = 30,
                          sliderInput(inputId = "range", 
                                      label = "Year", 
                                      min = 2007, 
                                      max = 2024, 
                                      value = 2024, 
                                      step = 1,
                                      ticks = FALSE,
                                      sep = "")
                                  )
                   
                   )
          
              )  # end tabset panel
  
        }) # end renderUI
  
} # end server