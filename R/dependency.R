
#' Title
#'
#' @return
#' @export
html_dependency_dataui <- function() {
  htmlDependency(
    name = 'data-ui',
    version = '0.8.4',
    src = c(file = system.file("www", package="dataui")),
    script = "dataui.standalone.js"
  )
}