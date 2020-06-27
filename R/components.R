#' Bars for Histograms
#'
#' @param rawData
#' @param ...
#'
#' @return
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
#' @param rawData
#' @param ...
#'
#' @return
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
#' @param ...
#'
#' @return
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
#' @param ...
#'
#' @return
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
#' @param ...
#'
#' @return
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
#' @param ...
#'
#' @return
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
#' @param ...
#'
#' @return
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
#' @param ...
#'
#' @return
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
#' @param ...
#'
#' @return
#' @export
#'

dui_sparkbandline <- function(
  ...
) {
  reactR::React$BandLine(
    ...
  )
}

#' Pattern Fill for 'Sparklines'
#'
#' @param ...
#'
#' @return
#' @export
#'

dui_sparkpatternlines <- function(
  ...
) {
  reactR::React$PatternLines(
    ...
  )
}

#' Tooltip Container for 'Sparklines'
#'
#' @param components
#'
#' @return
#' @export
dui_tooltip <- function(
  components
) {
  component <- reactR::React$TooltipComponent()
  component$children <- components
  component
}

#' Vertical Reference Line for 'Sparklines'
#'
#' @param ...
#'
#' @return
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
#' @param ...
#'
#' @return
#' @export
#'

dui_sparkhorizontalrefline <- function(
  ...
) {
  reactR::React$HorizontalReferenceLine(
    ...
  )
}

#' Linear Gradient for 'Sparklines'
#'
#' @param ...
#'
#' @return
#' @export
#'

dui_sparklineargradient <- function(
  ...
) {
  reactR::React$LinearGradient(
    ...
  )
}

#' Labels for 'Sparklines'
#'
#' @param ...
#'
#' @return
#' @export
#'

dui_sparklabel <- function(
  ...
) {
  reactR::React$Label(
    ...
  )
}
