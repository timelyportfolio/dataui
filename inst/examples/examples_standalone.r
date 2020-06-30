library(htmltools)
library(dataui)

browsable(
  tagList(
    reactR::html_dependency_react(),
    reactR::html_dependency_reacttools(),
    html_dependency_dataui(),
    tags$div(id = "chart"),
    tags$div(id = "chart-hydrate"),
    tags$div(id = "chart-hydrate-fromwidget"),
    tags$script(HTML(
sprintf(
"
const sparklineProps = {
  ariaLabel: 'This is a Sparkline of...',
  width: 500,
  height: 100,
  margin: { top: 24, right: 80, bottom: 24, left: 8 },
};

const data = {data: [1,2,3,4,5,6]}


const renderTooltip = function (_ref) {
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

const spk = React.createElement(
  dataui.SparklineWithTooltip,
  Object.assign(
    data,
    sparklineProps,
    {renderTooltip: renderTooltip}
  ),
  React.createElement(dataui.SparklineLineSeries)
)


ReactDOM.render(spk, document.getElementById('chart'))

const spk_hydrate = window.reactR.hydrate(
  dataui,
  {
    name: 'SparklineWithTooltip',
    attribs: {...sparklineProps, ...data, ...renderTooltip},
    children: [
      {name: 'SparklineLineSeries', attribs: {stroke: 'purple'}, children: []}
    ]
  }
)

ReactDOM.render(spk_hydrate, document.getElementById('chart-hydrate'))

const spk_hydrate_from_widget = window.reactR.hydrate(
  dataui,
  %s
)

ReactDOM.render(spk_hydrate_from_widget, document.getElementById('chart-hydrate-fromwidget'))
",
  jsonlite::toJSON(
    dui_sparkline(data = 1:6, components = list(dui_sparklineseries(stroke="gray")))$x$tag,
    auto_unbox = TRUE,
    force = TRUE
  )
)

    ))
  )
)
