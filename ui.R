#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("UFOlogy - UFOs' observations in UK from 1974 to 2014"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            p("Just click on the (?) icons to get some documentation on this Shiny App."),
            sliderInput("year",
                        "Year of observation:",
                        min = 1974,
                        max = 2014,
                        value = 1995)%>% helper(type = "inline",
                                                title = "Select the year",
                                                content = c("This is a <b>slider</b>.",
                                                            "Use this input to select the desired year of UFOs' observations")),
            tableOutput("ufotable")%>% helper(type = "inline",
                                              title = "Number of observed UFOs sorted by type",
                                              content = c("This table shows the number of UFOs' observations in UK per type of UFOs during the selected year")),
            
            ),

        # Show a plot of the generated distribution
        mainPanel(
            leafletOutput("ufomap")%>% helper(type = "inline",
                                              title = "UFOs' observations",
                                              content = c("All recorder UFOs' observations in UK for the choosen year are shown on the map.",
                                                          "Mouse on the markers will show the exact location (City) of the observation")),
            
        )
    )
))
