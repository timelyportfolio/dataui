#' <Add Title>
#'
#' <Add Description>
#'
#' @param data
#' @param className
#' @param margin
#' @param max
#' @param min
#' @param onMouseMove
#' @param onMouseLeave
#' @param preserveAspectRatio
#' @param valueAccessor
#' @param viewBox
#' @param ariaLabel
#' @param components
#' @param width
#' @param height
#' @param elementId
#'
#' @import htmlwidgets
#'
#' @export
dui_sparkline <- function(
  data = NULL,
  className = NULL,
  margin = NULL,
  max = NULL,
  min = NULL,
  onMouseMove = NULL,
  onMouseLeave = NULL,
  preserveAspectRatio = NULL,
  valueAccessor = NULL,
  viewBox = NULL,
  ariaLabel = NULL,
  components = list(),
  width = NULL, height = NULL, elementId = NULL
) {

    # describe a React component to send to the browser for rendering.
  component <- reactR::component(
    "Sparkline",
    Filter(Negate(is.null),list(
      #props
      data = data,
      className = className,
      margin = margin,
      max = max,
      min = min,
      onMouseMove = onMouseMove,
      onMouseLeave = onMouseLeave,
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
