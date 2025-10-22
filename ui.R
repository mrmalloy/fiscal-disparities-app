ui <- fluidPage(
  
  headerPanel("Twin Cities' Fiscal Disparities Program"),
  
  sidebarLayout(position = "left",
                
                sidebarPanel(includeHTML("sidebar.HTML")
                             ), 
                
                mainPanel(#uiOutput("tab")
              #    tabsetPanel(
                #    tabPanel("Summary Map",
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
#                             )
                             
                   )
                    
                    
                          )
                )
            )