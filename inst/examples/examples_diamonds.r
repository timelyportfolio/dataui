library(dplyr)
library(htmltools)
library(dataui)
library(reactable)
data("diamonds", package="ggplot2")

hist_all <- hist(diamonds$price, breaks = 20, plot = FALSE)

dat <- diamonds %>%
  group_by(cut) %>%
  summarize(
    n = n(),
    mean_price = mean(price),
    hist = list(unclass(hist(price, breaks = hist_all$breaks, plot = FALSE)))
  )

topo <- topo.colors(10)

components <- lapply(dat$hist, function(h, i) {
  x <- hist_to_binned_data(h = h, density = FALSE)
  dui_densityseries(binnedData = x, fill = topo[i], stroke = topo[i], fillOpacity = 0.2)
}, i = seq_along(length(dat$hist)))
# add density for all
# components[[length(components) + 1]] <- dui_densityseries(
#   binnedData = hist_to_binned_data(hist_all),
#   stroke = "#ccc",
#   fill = "#ccc",
#   fillOpacity = 0.5
# )

dui_histogram(
  #cumulative = TRUE,
  normalized = TRUE,
  components = c(components, list(dui_xaxis(),dui_yaxis()))
)

max_pct <- max(unlist(lapply(dat$hist, function(x) {x$counts/sum(x$counts)})))
max_density <- max(unlist(lapply(dat$hist, function(x) {x$density})))

# standalone sparkline version
dat %>%
  reactable(
    style = "font-family: sans-serif;",
    rowStyle = "font-size:1.2rem; align-items: flex-end; border-bottom: 1px solid lightgray;",
    compact = TRUE,
    borderless = TRUE,
    striped = TRUE,
    defaultColDef = colDef(headerStyle = "text-transform: uppercase; align-self: flex-end; font-weight:normal;"),
    columns = list(
      cut = colDef(name = "Cut"),
      n = colDef(name = "Count", format = colFormat(separators = TRUE)),
      mean_price = colDef(name = "Avg. Price", format = colFormat(currency = "USD", separators = TRUE) ),
      hist = colDef(
        name = "Price Histogram",
        sortable = FALSE,
        cell = dui_for_reactable(
          dui_sparkline(
            data = htmlwidgets::JS("cellInfo.value.density"),
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
      )
    )
  ) %>%
  dataui::dui_add_reactable_dep()

# htmlwidget version
dat %>%
  reactable(
    style = "font-family: sans-serif;",
    rowStyle = "font-size:1.2rem; align-items: flex-end; border-bottom: 1px solid lightgray;",
    compact = TRUE,
    borderless = TRUE,
    striped = TRUE,
    defaultColDef = colDef(headerStyle = "text-transform: uppercase; align-self: flex-end; font-weight:normal;"),
    columns = list(
      cut = colDef(name = "Cut"),
      n = colDef(name = "Count", format = colFormat(separators = TRUE)),
      mean_price = colDef(name = "Avg. Price", format = colFormat(currency = "USD", separators = TRUE) ),
      hist = colDef(
        #width = 400,
        name = "Price Histogram",
        sortable = FALSE,
        cell = function(value, info)  {
          dui_sparkline(
            data = value$density,
            max = max_density,
            height = 80,
            width = "100%",
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
        }
      )
    )
  )
