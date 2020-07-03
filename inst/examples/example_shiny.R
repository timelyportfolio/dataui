library(shiny)
library(dataui)

ui <- datauiOutput('spk')

server <- function(input, output, session) {
  n_to_plot <- 100
  randomnumbers <- rnorm(n_to_plot, mean=10, sd=3)

  output$spk <- renderDataui({
    invalidateLater(50, session = session)
    randomnumbers <<- append(randomnumbers, rnorm(1, mean=10, sd=3))[-1]
    dui_sparkline(
      data = randomnumbers,
      min = 0, max = 20,
      margin = list(right = 20),
      components = list(
        dui_sparkbarseries(
          fill = htmlwidgets::JS("(d) => Math.abs(d-10) > 6 ? 'purple' : '#888'")
        ),
        dui_sparkhorizontalrefline(
          reference = 10,
          stroke = "#ddd",
          renderLabel = htmlwidgets::JS("(d) => 10")
        )
      )
    )

  })
}

shinyApp(ui, server)
