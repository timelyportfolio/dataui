#' 'data-ui' Histogram
#'
#' Create interactive histogram visualizations with 'data-ui'.  The histogram will
#' perform the calculations in 'JavaScript' if the data is raw.  If you would like
#' more control over the calculation, then you can pass pre-binned values
#' with help from \code{\link{hist_to_binned_data}}.  \{dui_histogram} works well
#' as a full-featured visualization or can also be used as a 'sparkline` in smaller
#' contexts.
#'
#' @param binCount
#' @param binType
#' @param binValues
#' @param cumulative
#' @param horizontal
#' @param limits
#' @param margin
#' @param normalized
#' @param renderTooltip
#' @param valueAccessor
#' @param onMouseMove
#' @param onMouseLeave
#' @param tooltipData
#' @param ariaLabel
#' @param width
#' @param height
#' @param components
#' @param elementId
#'
#' @import htmlwidgets
#'
#' @return \code{htmlwidget}
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
#' @param width,height Must be a valid CSS unit (like \code{'100\%%'},
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
