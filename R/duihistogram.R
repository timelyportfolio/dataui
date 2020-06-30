#' 'data-ui' Histogram
#'
#' Create interactive histogram visualizations with 'data-ui'.  The histogram will
#' perform the calculations in 'JavaScript' if the data is raw.  If you would like
#' more control over the calculation, then you can pass pre-binned values
#' with help from \code{\link{hist_to_binned_data}}.  \code{dui_histogram} works well
#' as a full-featured visualization or can also be used as a 'sparkline` in smaller
#' contexts.
#'
#' @param binCount \code{numeric} specifying the approximate number of bins to calculate.
#' @param binType \code{character} one of \code{'numeric'}(default) or \code{'categorical'}.
#' @param binValues \code{numeric vector} of the bin or break values to override the
#'          automatic calculations.
#' @param cumulative \code{logical} to specify whether or not the histogram will display
#'          cumulative sums of the counts.
#' @param horizontal \code{logical} with \code{TRUE} meaning the chart will be in
#'          horizontal layout.
#' @param limits \code{numeric vector} of length two to give a range for which values
#'          will be ignored if they are outside of the range.
#' @param margin \code{list} of the form \code{list(top =, right =, bottom =, left=)}
#'          that will specify the margins for the 'sparkline' chart.
#' @param normalized \code{logical} specifying whether or not to the values will be
#'          calculated as a percent of total.
#' @param renderTooltip \code{htmlwidget::JS} function that will provide the 'React' element
#'          to render when a user moves their mouse over the visualization.  The function
#'          should follow the signature \code{({ event, data, datum, color }) =>}.  If the
#'          function returns a \code{falsy} value then nothing will be rendered.
#' @param valueAccessor \code{htmlwidgets::JS} function to let the chart know where to
#'          look for the \code{y} value in the \code{data}.  An example would look like
#'          \code{(d) => d.yval} where \code{yval} is the property containing the value.
#' @param onMouseMove,onMouseLeave \code{htmlwidgets::JS} function to run on mouse events.
#' @param tooltipData currently not supported.
#' @param ariaLabel \code{character} accessibility label for the chart
#' @param components \code{list} of children (series or reference lines) to include
#'          in the histogram.  Multiple components should be wrapped in \code{list} such as
#'          \code{components = list(dui_densityseries, dui_barseries())}.
#' @param width,height \code{numeric} valid 'css' size unit.  For \code{height}, this should
#'          always be \code{numeric}, but \code{width} might be something like \code{'100\%'}
#'          or \code{'50vw'}.
#' @param elementId \code{character} valid 'css' identifier for the \code{htmlwidget}
#'          container.
#'
#' @import htmlwidgets
#'
#' @return react \code{htmlwidget}
#' @export
dui_histogram <- function(
  rawData = NULL,
  binCount = NULL,
  binType = NULL,
  binValues = NULL,
  cumulative = NULL,
  horizontal = NULL,
  limits = NULL,
  margin = NULL,
  normalized = NULL,
  renderTooltip = NULL,
  valueAccessor = NULL,
  onMouseMove = NULL,
  onMouseLeave = NULL,
  tooltipData = NULL,
  ariaLabel = NULL,
  components = NULL,
  width = 600, height = 400, elementId = NULL
) {

  # describe a React component to send to the browser for rendering.
  component <- reactR::component(
    "Histogram",
    Filter(Negate(is.null),list(
      #props
      binCount = binCount,
      binType = binType,
      binValues = binValues,
      cumulative = cumulative,
      horizontal = horizontal,
      limits = limits,
      margin = margin,
      normalized = normalized,
      renderTooltip = renderTooltip,
      valueAccessor = valueAccessor,
      onMouseMove = onMouseMove,
      onMouseLeave = onMouseLeave,
      tooltipData = tooltipData,
      ariaLabel = ariaLabel,
      height = height,
      width = width
    ))
  )

  # expects components to be a list of lists so convert
  #   if a user does not wrap a single component with list()
  components <- wrap_components(components)

  # create widget
  hw <- htmlwidgets::createWidget(
    name = 'dataui',
    reactR::reactMarkup(component),
    width = width,
    height = height,
    package = 'dataui',
    elementId = elementId
  )

  hw$x$tag$children <- components
  hw
}

#' Shiny Bindings for 'dataui'
#'
#' Output and render functions for using dataui within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'}),
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a dataui
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name dataui-shiny
#'
#' @export
datauiOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'dataui', width, height, package = 'dataui')
}

#' @rdname dataui-shiny
#' @export
renderDataui <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, datauiOutput, env, quoted = TRUE)
}

#' Called by HTMLWidgets to produce the widget's root element.
#' @rdname dataui-shiny
dataui_html <- function(id, style, class, ...) {
  htmltools::tagList(
    # Necessary for RStudio viewer version < 1.2
    reactR::html_dependency_corejs(),
    reactR::html_dependency_react(),
    reactR::html_dependency_reacttools(),
    htmltools::tags$div(id = id, class = class, style = style)
  )
}
