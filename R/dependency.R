
#' 'JavaScript' Dependencies for Standalone Usage
#'
#' 'dataui' also ships a standalone version of the 'JavaScript' allowing
#' for usage outside of a traditional \code{htmlwidget} context.  The variable \code{dataui}
#' is added to \code{window} object.  Usage of \code{html_dependency_dataui} should likely
#' be accompanied with \code{\link[reactR]{html_dependency_react}} along with
#' \code{\link[reactR]{html_dependency_reacttools}} for \code{hydrate}.
#'
#' @return \code{htmltools::htmlDependency}
#' @export
#' @example inst/examples/examples_standalone.R
html_dependency_dataui <- function() {
  htmltools::htmlDependency(
    name = 'data-ui',
    version = '0.8.4',
    src = c(file = system.file("www", package="dataui")),
    script = "dataui.standalone.js"
  )
}
