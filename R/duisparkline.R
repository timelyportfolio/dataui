#' 'data-ui Sparklines'
#'
#' Create interactive 'sparklines' visualizations for use as a standalone component or
#' in combination with 'reactable' or other table libraries.  There are a wide variety of
#' components for use with \code{dui_sparkline}, including lines, bars, points, reference
#' lines, and labels.  These 'sparklines' automatically include responsive and tooltip
#' behaviors.
#'
#' @param data \code{vector}, \code{list}, \code{data.frame} of data that will be passed
#'          down to the component series.
#' @param className \code{character} 'css' class name to be added to the 'sparkline'.
#' @param margin \code{list} of the form \code{list(top =, right =, bottom =, left=)}
#'          that will specify the margins for the 'sparkline' chart.
#' @param max,min \code{numeric} value that will be the maximum/minimum for the 'y' axis/scale.  This
#'          is useful if you have multiple 'sparklines' that you want to all use the
#'          same scale.
#' @param onMouseMove,onMouseLeave \code{htmlwidgets::JS} function to run on mouse events.
#'          These are automatically assigned with 'sparkline' \code{htmlwidgets} so it
#'          is unlikely that you will want to override the default \code{NULL}.
#' @param renderTooltip \code{htmlwidget::JS} function that will provide the 'React' element
#'          to render when a user moves their mouse over the visualization.  The function
#'          should follow the signature \code{({ event, data, datum, color }) =>}.  If the
#'          function returns a \code{falsy} value then nothing will be rendered.
#' @param preserveAspectRatio \code{character} to specify this attribute on the \code{svg}
#'          chart container.  See
#'          \href{https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/preserveAspectRatio}{preserveAspectRatio}.
#' @param valueAccessor \code{htmlwidgets::JS} function to let the chart know where to
#'          look for the \code{y} value in the \code{data}.  An example would look like
#'          \code{(d) => d.yval} where \code{yval} is the property containing the value.
#' @param viewBox \code{character} to specify this attribute on the \code{svg}.  See
#'          \href{https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/viewBox}{viewBox}.
#' @param ariaLabel \code{character} label for accessibility for screen readers
#' @param components \code{list} of children (series or reference lines) to include
#'          in the sparkline.  Multiple components should be wrapped in \code{list} such as
#'          \code{components = list(dui_sparklineseries, dui_sparkbarseries())}.  \code{dui_tooltip}
#'          component should also contain a similar list in effect forming a tree.
#' @param responsive \code{logical} with default as \code{TRUE}.  This argument is not passed
#'          on to the \code{React} component as a \code{prop}.  Rather it is used in the \code{R}
#'          constructor to choose our \code{SparklineResponsive} component (\code{TRUE}) or
#'          \code{SparklineWithTooltip} (\code{FALSE}) component.  Since \code{height} can be unstable
#'          and finicky, we only make \code{width} responsive.
#' @param width,height \code{numeric} valid 'css' size unit.  For \code{height}, this should
#'          always be \code{numeric}, but \code{width} might be something like \code{'100\%'}
#'          or \code{'50vw'}.
#' @param elementId \code{character} valid 'css' identifier for the \code{htmlwidget}
#'          container.
#'
#'
#' @import htmlwidgets
#' @return react \code{htmlwidget}
#' @export
dui_sparkline <- function(
  data = NULL,
  className = NULL,
  margin = NULL,
  max = NULL,
  min = NULL,
  onMouseMove = NULL,
  onMouseLeave = NULL,
  renderTooltip = NULL,
  preserveAspectRatio = NULL,
  valueAccessor = NULL,
  viewBox = NULL,
  ariaLabel = NULL,
  components = list(),
  responsive = TRUE,
  width = "100%", height = 100, elementId = NULL
) {

  # responsive is great but does not always work in edge cases
  if(responsive == TRUE || is.null(width)) {
    tagname <- "SparklineResponsive"
  } else {
    tagname <- "SparklineWithTooltip"
  }
  if(responsive == FALSE && !is.numeric(width)){
    message(paste0(
      "Responsive is FALSE which often means width should be numeric to work properly.  ",
      paste0("In this case we see responsive = FALSE and width = ", width, ".  "),
      "Try a different width if the sparkline does not appear.",
      collapse = "\n"
    ))
  }
  # describe a React component to send to the browser for rendering.
  component <- reactR::component(
    tagname,
    Filter(Negate(is.null),list(
      #props
      data = data,
      className = className,
      margin = margin,
      max = max,
      min = min,
      onMouseMove = onMouseMove,
      onMouseLeave = onMouseLeave,
      renderTooltip = renderTooltip,
      preserveAspectRatio = preserveAspectRatio,
      valueAccessor = valueAccessor,
      viewBox = viewBox,
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
