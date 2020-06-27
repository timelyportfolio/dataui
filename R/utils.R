#' Convert Histogram to Binned Format
#'
#' This is a convenience function to convert a histogram object from \code{\link[graphics]{hist}}
#' into the binned value format expected by 'data-ui' \code{\link{dui_barseries}}
#' and \code{\link{dui_densityseries}} argument \code{binnedData}.
#'
#' @param h histogram object or list from \code{\link[graphics]{hist}}
#' @param density \code{logical} to indicate the use of \code{density} or \code{count}
#'
#' @return \code{list}
#' @export
#'
#' @examples
#' library(dataui)
#'
#' h <- graphics::hist(stats::rnorm(100), plot = FALSE)
#' dui_histogram(
#'   components = list(
#'     dui_barseries(binnedData = hist_to_binned_data(h))
#'   )
#' )
hist_to_binned_data <- function(h = NULL, density=TRUE) {
  mapply(
    function(d,i,brk1,brk2) {
      l <- list(brk1,brk2,d,as.character(i))
      names(l) <- c("bin0", "bin1", "count", "id")
      l
    },
    if(density == TRUE) {h$density} else {h$counts},
    seq_along(h$density),
    h$breaks[-length(h$breaks)],
    h$breaks[-1],
    SIMPLIFY = FALSE,
    USE.NAMES = FALSE
  )
}
