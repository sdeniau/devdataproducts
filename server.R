#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(lubridate)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    observe_helpers(help_dir = "helpfiles")
        
    output$ufomap <- renderLeaflet({
        ufoselect <- ufo %>% filter(time==input$year)
        ufoselect %>% 
            leaflet() %>%
            addTiles() %>%
            addMarkers(lat=~latitude, lng=~longitude, label=~city)

    })
    
    output$ufotable <- renderTable({
            ufotable <- ufo %>% filter(time==input$year) %>% 
                    group_by(UFO_shape) %>% summarise (nb=n()) %>% 
                    arrange(desc(nb))
            ufotable
    })
    

})
