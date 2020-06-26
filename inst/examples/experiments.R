library(dataui)

rn <- rnorm(1000)
ri <- runif(1000)

dui_histogram(
  height = 400,
  width = 600,
  binCount = 25,
  components = list(
    dui_barseries(rawData = rn, fill="#000"),
    dui_densityseries(rawData = rn, stroke = "#000"),
    dui_barseries(rawData = ri),
    dui_densityseries(rawData = ri),
    dui_xaxis(),
    dui_yaxis()
  )
)

dui_histogram(
  height = 400,
  width = 600,
  components = list(dui_barseries(runif(1:100)))
)

dui_histogram(
  height = 150,
  width = 400,
  binCount = 25,
  renderTooltip = htmlwidgets::JS(reactR::babel_transform("
{({ event, datum, data, color }) => (
  <div>
    <strong style={{ color }}>{datum.bin0} to {datum.bin1}</strong>
    <div><strong>count </strong>{datum.count}</div>
    <div><strong>cumulative </strong>{datum.cumulative}</div>
    <div><strong>density </strong>{datum.density}</div>
  </div>
)}
  ")),
  components = list(
    dui_barseries(
      rawData = rlnorm(1000)
    )
  )
)


library(dplyr)
library(reactable)

data <- chickwts %>%
  group_by(feed) %>%
  summarise(weight = list(weight))

binValues = hist(chickwts$weight, breaks=15, plot = FALSE)$breaks

fillColors = scales::brewer_pal(type="qual", palette="Set2")(8)

reactable(
  data,
  columns = list(
    feed = colDef(maxWidth = 100),
    weight = colDef(
      minWidth = 400,
      cell = function(values, index) {
        dui_histogram(
          height = 200,
          width = 400,
          binValues = binValues,
          renderTooltip = htmlwidgets::JS(reactR::babel_transform("
{({ event, datum, data, color }) => (
  <div>
    <strong style={{ color }}>{datum.bin0} to {datum.bin1}</strong>
    <div><strong>count </strong>{datum.count}</div>
    <div><strong>cumulative </strong>{datum.cumulative.toFixed(0)}</div>
    <div><strong>density </strong>{datum.density.toFixed(0)}</div>
  </div>
)}
          ")),
          components = list(
            dui_barseries(rawData = values, fill = fillColors[index]),
            dui_densityseries(rawData = values, stroke = fillColors[index], fill = fillColors[index]),
            dui_xaxis()
          )
        )
      }
    )
  ),
  width = 600
)


reactable(
  data,
  columns = list(
    feed = colDef(maxWidth = 100),
    weight = colDef(
      minWidth = 400,
      cell = function(values, index) {
        dui_histogram(
          height = 200,
          width = 400,
          binValues = binValues,
          renderTooltip = htmlwidgets::JS(reactR::babel_transform("
{({ event, datum, data, color }) => (
  // can be any react component but we will need to expose the libraries
  <svg width = {100} height = {100}>
    <circle cx={50} cy = {50} r= {50}/>
  </svg>
)}
          ")),
          components = list(
            dui_barseries(rawData = values, fill = fillColors[index]),
            dui_densityseries(rawData = values, stroke = fillColors[index], fill = fillColors[index]),
            dui_xaxis(numTicks = 2)
          )
        )
      }
    )
  ),
  width = 600
)
