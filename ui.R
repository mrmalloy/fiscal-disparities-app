ui <- fluidPage(
  
  headerPanel("Twin Cities' Fiscal Disparities Program"),
  
  sidebarLayout(position = "left",
                
                sidebarPanel(includeHTML("sidebar.HTML")
                             ), 
                
                mainPanel(uiOutput("tab")
                          )
                )
            )