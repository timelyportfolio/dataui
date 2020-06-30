#' 'data-ui Sparklines'
#'
#' Create interactive 'sparklines' visualizations for use as a standalone comoponent or
#' in combination with 'reactable' or other table libraries.  There are a wide variety of
#' components for use with \code{dui_sparkline}, including lines, bars, points, reference
#' lines, and labels.  These 'sparklines' automatically include responsive and tooltip
#' behaviors.
#'
#' @param data
#' @param className
#' @param margin
#' @param max
#' @param min
#' @param onMouseMove
#' @param onMouseLeave
#' @param renderTooltip
#' @param preserveAspectRatio
#' @param valueAccessor
#' @param viewBox
#' @param ariaLabel
#' @param components
#' @param responsive \code{logical} with default as \code{TRUE}.  This argument is not passed
#'          on to the \code{React} component as a \code{prop}.  Rather it is used in the \code{R}
#'          constructor to choose our \code{SparklineResponsive} component (\code{TRUE}) or
#'          \code{SparklineWithTooltip} (\code{FALSE}) component.  Since \code{height} can be unstable
#'          and finicky, we only make \code{width} responsive.
#' @param width
#' @param height
#' @param elementId
#'
#' @import htmlwidgets
#' @return \code{htmlwidget}
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
  width = 300, height = 100, elementId = NULL
) {

  # responsive is great but does not always work in edge cases
  if(responsive == TRUE || is.null(width)) {
    tagname <- "SparklineResponsive"
  } else {
    tagname <- "SparklineWithTooltip"
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
