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
