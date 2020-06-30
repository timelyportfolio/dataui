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
#' @param ... see \href{https://github.com/williaster/data-ui/tree/master/packages/sparkline#series}{data-ui series}
#'
#' @return \code{reactR component} which is a special form of \code{htmltools::tag}
#' @export
#'

dui_sparkbarseries <- function(
  ...
) {
  reactR::React$SparklineBarSeries(
    ...
  )
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
