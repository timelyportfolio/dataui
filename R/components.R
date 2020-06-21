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
dui_xAxis <- function(
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
dui_yAxis <- function(
  ...
) {
  reactR::React$YAxis(
    ...
  )
}
