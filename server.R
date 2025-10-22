server <- function(input, output, session){

## map 'canvas' on which we'll do proxy map
output$map <- renderLeaflet(
  
  leaflet() %>%
    addProviderTiles(provider = "CartoDB.PositronNoLabels", 
                     options = tileOptions(minZoom = 8,
                                           maxZoom = 14)) %>%
    addProviderTiles(provider = "CartoDB.PositronOnlyLabels", 
                     options = providerTileOptions(pane = "markerPane")) %>%
    setView(lat = 45.01703533693066, 
            lng = -93.28526881776821, 
            zoom = 9)
  
)

## final output object to call
output$tab <- renderUI({
    tabsetPanel(
          tabPanel("Summary Map",
                   tags$head(tags$style(type = "text/css", "#map {height:80vh !important;}")),
                   leafletOutput("map"),
                   absolutePanel(top = 50, right = 30,
                          sliderInput(inputId = "FDyr", 
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

## dataset filtered to input slider yr
filtered_data <- reactive({
  
  base[base$yr == tail(input$FDyr, 1),] 
  
})  

## proxyMap

observe({
  
  leafletProxy("map", data = filtered_data()) %>%
    addPolygons(data = base, 
                weight = 0.2,
                color = "grey",
                fillColor = ~pal1(total_tb_comind_withfd),
                fillOpacity = 0.8)
    
})

  
} # end server