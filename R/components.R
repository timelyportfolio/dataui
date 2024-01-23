#' Bars for Histograms
#'
#' @param rawData \code{vector}, \code{list}, \code{data.frame} of data
#' @param ... see \href{https://github.com/williaster/data-ui/tree/master/packages/histogram#series-}{data-ui series}
#'
#' @return \code{reactR component} which is a special form of \code{htmltools::tag}
#' @export
dui_barseries <- function(
  rawData = NULL,
  ...
) {
  reactR::React$BarSeries(
    rawData = rawData,
    ...
  )
}

#' Density Line Series for Histograms
#'
#' @param rawData \code{vector}, \code{list}, \code{data.frame} of data
#' @param ... see \href{https://github.com/williaster/data-ui/tree/master/packages/histogram#series-}{data-ui series}
#'
#' @return \code{reactR component} which is a special form of \code{htmltools::tag}
#' @export
dui_densityseries <- function(
  rawData = NULL,
  ...
) {
  reactR::React$DensitySeries(
    rawData = rawData,
    ...
  )
}


#' 'X' Axis for Histograms
#'
#' @param ... see \href{https://github.com/williaster/data-ui/tree/master/packages/histogram#xaxis--and-yaxis-}{data-ui axis}
#'
#' @return \code{reactR component} which is a special form of \code{htmltools::tag}
#' @export
#'

dui_xaxis <- function(
  ...
) {
  reactR::React$XAxis(
    ...
  )
}


#' 'Y' Axis for Histograms
#'
#' @param ... see \href{https://github.com/williaster/data-ui/tree/master/packages/histogram#xaxis--and-yaxis-}{data-ui axis}
#'
#' @return \code{reactR component} which is a special form of \code{htmltools::tag}
#' @export
#'

dui_yaxis <- function(
  ...
) {
  reactR::React$YAxis(
    ...
  )
}

#' Line Series for 'Sparklines'
#'
#' @param ... see \href{https://github.com/williaster/data-ui/tree/master/packages/sparkline#series}{data-ui series}
#'
#' @return \code{reactR component} which is a special form of \code{htmltools::tag}
#' @export
#'

dui_sparklineseries <- function(
  ...
) {
  reactR::React$SparklineLineSeries(
    ...
  )
}

#' Bar Series for 'Sparklines'
#'
#' For additional information and documentation, see \href{https://github.com/williaster/data-ui/tree/master/packages/sparkline#series}{data-ui series}.
#'
#' @param data \code{vector}, \code{list}, \code{data.frame} of data.  In most cases \code{data} will be passed from the \code{'sparkline'} parent wrapper.
#' @param fill \code{string} representing valid color name or hexadecimal color or a \code{htmlwidgets::JS} function with the following signature \code{(yVal, i) => fill}.  The 'JavaScript' default is \code{"#22b8cf"}.
#' @param fillOpacity \code{number} ranging from zero to one for the opacity of every bar or a \code{htmlwidgets::JS} function with the following signature \code{(yVal, i) => opacity} called for each data point.  The 'JavaScript' default is \code{0.7}.
#' @param getX,getY \code{htmlwidgets::JS} function to return the 'x' and 'y' value in the data series.  In most cases \code{getX,getY} will be passed from the \code{'sparkline'} parent wrapper.
#' @param labelOffset \code{number} of pixels to offset the label from the bar shape.  The 'JavaScript' default is code {8}.
#' @param LabelComponent \code{htmlwidgets::JS} function representing a 'React' or 'DOM' element for the label. The 'JavaScript' default is \code{<Label {...svgLabel.baseTickLabel} stroke="#fff" />}.
#' @param labelPosition \code{string} one of "top", "bottom", "left", "right" or a \code{htmlwidgets::JS} function with the following signature \code{(yVal, i) => position} called for each data point.
#' @param onMouseMove,onMouseLeave \code{htmlwidgets::JS} function with the following signature \code{({ data, datum, event, index, color }) => ...} called on mouse move and leave.
#' @param renderLabel \code{htmlwidgets::JS} function with the following signature \code{(val, i) => node}.
#' @param stroke  \code{string} representing valid color name or hexadecimal color or a \code{htmlwidgets::JS} function with the following signature \code{(yVal, i) => stroke}.  The 'JavaScript' default is \code{"white"}.
#' @param strokeWidth \code{number} for the stroke width of every bar or a \code{htmlwidgets::JS} function with the following signature \code{(yVal, i) => strokeWidth} called for each data point.  The 'JavaScript' default is \code{1}.
#' @param xScale,yScale \code{htmlwidgets::JS} function to override the scale for 'x' and or 'y' axes.  In most cases \code{xScale,yScale} will be passed from the \code{'sparkline'} parent wrapper.
#'
#' @return \code{reactR component} which is a special form of \code{htmltools::tag}
#' @export
#'
dui_sparkbarseries <- function(
  data = NULL,
  fill = NULL,
  fillOpacity = NULL,
  getX = NULL,
  getY = NULL,
  labelOffset = NULL,
  LabelComponent = NULL,
  labelPosition = NULL,
  onMouseMove = NULL,
  onMouseLeave = NULL,
  renderLabel = NULL,
  stroke = NULL,
  strokeWidth = NULL,
  yScale = NULL,
  xScale = NULL
) {
  props <- Filter(Negate(is.null),list(
    #props
    data = data,
    fill = fill,
    fillOpacity = fillOpacity,
    getX = getX,
    getY = getY,
    labelOffset = labelOffset,
    LabelComponent = LabelComponent,
    labelPosition = labelPosition,
    onMouseMove = onMouseMove,
    onMouseLeave = onMouseLeave,
    renderLabel = renderLabel,
    stroke = stroke,
    strokeWidth = strokeWidth,
    yScale = yScale,
    xScale = xScale
  ))
  # use do.call to avoid empty named list which will become children []
  do.call(reactR::React$SparklineBarSeries, props)

}

#' Point Series for 'Sparklines'
#'
#' @param ... see \href{https://github.com/williaster/data-ui/tree/master/packages/sparkline#series}{data-ui series}
#'
#' @return \code{reactR component} which is a special form of \code{htmltools::tag}
#' @export
#'

dui_sparkpointseries <- function(
  ...
) {
  reactR::React$SparklinePointSeries(
    ...
  )
}

#' Horizontal Reference Line for 'Sparklines'
#'
#' @param ... see \href{https://github.com/williaster/data-ui/tree/master/packages/sparkline#reference-lines-and-bands}{data-ui reference lines and bands}
#'
#' @return \code{reactR component} which is a special form of \code{htmltools::tag}
#' @export
#'

dui_sparkrefline <- function(
  ...
) {
  reactR::React$HorizontalReferenceLine(
    ...
  )
}

#' Band Lines for 'Sparklines'
#'
#' @param ... see \href{https://github.com/williaster/data-ui/tree/master/packages/sparkline#reference-lines-and-bands}{data-ui reference lines and bands}
#'
#' @return \code{reactR component} which is a special form of \code{htmltools::tag}
#' @export
#'

dui_sparkbandline <- function(
  ...
) {
  reactR::React$BandLine(
    ...
  )
}


#' Vertical Reference Line for 'Sparklines'
#'
#' @param ... see \href{https://github.com/williaster/data-ui/tree/master/packages/sparkline#reference-lines-and-bands}{data-ui reference lines and bands}
#'
#' @return \code{reactR component} which is a special form of \code{htmltools::tag}
#' @export
#'

dui_sparkverticalrefline <- function(
  ...
) {
  reactR::React$VerticalReferenceLine(
    ...
  )
}

#' Horizontal Reference Line for 'Sparklines'
#'
#' @param ... see \href{https://github.com/williaster/data-ui/tree/master/packages/sparkline#reference-lines-and-bands}{data-ui reference lines and bands}
#'
#' @return \code{reactR component} which is a special form of \code{htmltools::tag}
#' @export
#'

dui_sparkhorizontalrefline <- function(
  ...
) {
  reactR::React$HorizontalReferenceLine(
    ...
  )
}

#' Pattern Fill for 'Sparklines'
#'
#' @param ... see \href{https://github.com/williaster/data-ui/tree/master/packages/sparkline#patternlines--and-lineargradients}{data-ui patterns and gradients}
#'
#' @return \code{reactR component} which is a special form of \code{htmltools::tag}
#' @export
#'

dui_sparkpatternlines <- function(
  ...
) {
  reactR::React$PatternLines(
    ...
  )
}

#' Linear Gradient for 'Sparklines'
#'
#' @param ... see \href{https://github.com/williaster/data-ui/tree/master/packages/sparkline#patternlines--and-lineargradients}{data-ui patterns and gradients}
#'
#' @return \code{reactR component} which is a special form of \code{htmltools::tag}
#' @export
#'

dui_sparklineargradient <- function(
  ...
) {
  reactR::React$LinearGradient(
    ...
  )
}

#' Tooltip Container for 'Sparklines'
#'
#' @param components \code{list} of children (series or reference lines) to include
#'          in the sparkline.  Multiple components should be wrapped in \code{list} such as
#'          \code{components = list(dui_sparklineseries, dui_sparkverticalrefline())}.
#'
#' @return \code{reactR component} which is a special form of \code{htmltools::tag}
#' @export
dui_tooltip <- function(
  components
) {
  component <- reactR::React$TooltipComponent()

  # expects components to be a list of lists so convert
  #   if a user does not wrap a single component with list()
  components <- wrap_components(components)

  component$children <- components
  component
}


#' Labels for 'Sparklines'
#'
#' @param ... see \href{https://github.com/williaster/data-ui/blob/master/packages/sparkline/src/annotation/Label.jsx}{data-ui label}
#'
#' @return \code{reactR component} which is a special form of \code{htmltools::tag}
#' @export
#'

dui_sparklabel <- function(
  ...
) {
  reactR::React$Label(
    ...
  )
}
