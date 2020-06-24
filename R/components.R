#' Title
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

#' Title
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


#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
dui_xaxis <- function(
  ...
) {
  reactR::React$XAxis(
    ...
  )
}


#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
dui_yaxis <- function(
  ...
) {
  reactR::React$YAxis(
    ...
  )
}

#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
dui_sparklineseries <- function(
  ...
) {
  reactR::React$SparklineLineSeries(
    ...
  )
}

#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
dui_sparkbarseries <- function(
  ...
) {
  reactR::React$SparklineBarSeries(
    ...
  )
}

#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
dui_sparkpointseries <- function(
  ...
) {
  reactR::React$SparklinePointSeries(
    ...
  )
}

#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
dui_sparkrefline <- function(
  ...
) {
  reactR::React$HorizontalReferenceLine(
    ...
  )
}

#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
dui_sparkbandline <- function(
  ...
) {
  reactR::React$BandLine(
    ...
  )
}

#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
dui_sparkpatternlines <- function(
  ...
) {
  reactR::React$PatternLine(
    ...
  )
}

#' Title
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

#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
dui_sparkverticalrefline <- function(
  ...
) {
  reactR::React$VerticalReferenceLine(
    ...
  )
}

#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
dui_sparkhorizontalrefline <- function(
  ...
) {
  reactR::React$HorizontalReferenceLine(
    ...
  )
}
