library(shiny)
library(rMaps)

shinyUI(pageWithSidebar(
    headerPanel("World Map of Population"),
    sidebarPanel(
        #h1('test 1'),
        #h2('test 2'),
        #sliderInput("slideValue", label = h3("value"), 
         #           min = 6.8 , max = 1300 , value = 100)
        checkboxGroupInput("Groups", label = h3("Deciles"),
                           choices = list(">= 1.28B" = 1, "1.28B - 394.5M" = 2,
                                          "394.5M - 247.4M" = 3, "247.4M - 155.8M" = 4,
                                          "155.8M - 58.8M" = 5, "58.8M - 35.7M" = 6,
                                          "35.7M - 18.4M" = 7, "18.4M - 10.7M" = 8,
                                          "10.7M - 6.8M" = 9, "< 6.8M" = 10), 
                           selected = 1     
            )
    ),
    mainPanel(rCharts::chartOutput('popPlot', 'datamaps'))
    ))