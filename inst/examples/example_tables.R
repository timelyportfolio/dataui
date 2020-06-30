library(htmltools)

# not that you would want to do this but illustrates the usage of helper functions
browsable(
  dui_add_deps(
    tags$div(
      dui_chr(
        dui_sparkline(
          data = runif(100),
          components = list(
            dui_sparklineseries(strokeDasharray = "3,3"),
            dui_sparkpointseries(points = list("min","max"))
          )
        )
      )
    )
  )
)


library(dplyr)
library(htmltools)
library(dataui)

data("diamonds", package="ggplot2")

hist_all <- hist(diamonds$price, breaks = 20, plot = FALSE)

dat <- diamonds %>%
  group_by(cut) %>%
  summarize(
    n = n(),
    mean_price = mean(price),
    hist = list(unclass(hist(price, breaks = hist_all$breaks, plot = FALSE)))
  )

# calculate max so all sparklines use same scale
max_density <- max(unlist(lapply(dat$hist, function(x) {x$density})))

# convert hist column to character version of data-ui htmlwidget
dat <- dat %>%
  mutate(hist = lapply(hist, function(h){
    dui_chr(
      dui_sparkline(
        data = h$density,
        max = max_density,
        height = 80,
        margin = list(top = 0, bottom = 0, left = 20, right = 0),
        components = list(
          dui_sparkbarseries(),
          dui_tooltip(
            list(
              dui_sparkhorizontalrefline(
                stroke = "#ccc",
                strokeDasharray = "4,4"
              ),
              dui_sparkpointseries(
                renderLabel = htmlwidgets::JS("(d) => d ? (d*100000).toFixed(2) + '%' : null"),
                labelPosition = "right"
              )
            )
          )
        )
      )
    )
  }))

# datatable
library(DT)
DT::datatable(
  dat,
  escape = FALSE,
  options = list(
    fnDrawCallback = htmlwidgets::JS('function(){ HTMLWidgets.staticRender()}')
  )
) %>%
  formatCurrency("mean_price", digits = 0) %>%
  formatRound("n", digits = 0) %>%
  dui_add_deps()


