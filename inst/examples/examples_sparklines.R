library(dataui)

dui_sparkline(
  data = runif(20),
  height = 100,
  width = 150,
  components = list(
    dui_sparkpointseries(points = list("all"))
  )
)

dui_sparkline(
  data = runif(20),
  height = 100,
  width = 150,
  components = list(
    dui_sparklineseries()
  )
)

dui_sparkline(
  data = runif(20),
  height = 100,
  width = 150,
  components = list(
    dui_sparkbarseries()
  )
)

dui_sparkline(
  data = runif(20),
  height = 100,
  width = 250,
  components = list(
    dui_sparklineseries(),
    dui_sparkbarseries(),
    dui_sparkpointseries(points = list("all"))
  )
)

library(dataui)
dui_sparkline(
  data = runif(20),
  renderTooltip = htmlwidgets::JS(htmltools::HTML("
function (_ref) {
  var datum = _ref.datum;
  return React.createElement(
      'div',
      null,
      datum.x && React.createElement(
        'div',
        null,
        datum.x
      ),
      React.createElement(
        'div',
        null,
        datum.y ? datum.y.toFixed(2) : \"--\"
      )
  );
}
  ")),
  height = 200,
  width = 450,
  components = list(
    dui_sparkbarseries(),
    dui_sparklineseries(),
    dui_sparkpointseries(points = list("all")),
    dui_tooltip(
      components = list(
        dui_sparkverticalrefline(key="ref-vertical",strokeWidth=1, strokeDasharray="4 4"),
        dui_sparkpointseries(key="ref-point", fill="yellow", stroke="none"),
        dui_sparkhorizontalrefline(key="ref-horizonatal", strokeWidth=1, strokeDasharray="4 4")
      )
    )
  )
)

