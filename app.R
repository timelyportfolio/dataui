library(shiny)
library(dataui)

ui <- fluidPage(
  titlePanel("reactR HTMLWidget Example"),
  datauiOutput('widgetOutput')
)

server <- function(input, output, session) {
  output$widgetOutput <- renderDataui(
    dataui("Hello world!")
  )
}

shinyApp(ui, server)