#' Add 'data-ui' Dependencies to Tag or 'htmlwidget'
#'
#' @param tag_htmlwidget \code{shiny.tag} or \code{htmlwidget} to which
#'          you would like to add \code{data-ui} dependencies
#'
#' @return \code{shiny.tag} or \code{htmlwidget}
#' @export
#' @seealso \code{\link{dui_chr}}
#' @example inst/examples/example_tables.R
dui_add_deps <- function(tag_htmlwidget = NULL) {
  stopifnot(
    !is.null(tag_htmlwidget),
    inherits(tag_htmlwidget,c("htmlwidget", "shiny.tag", "shiny.tag.list",
                              "html"))
  )

  dui_deps <- c(
    list(reactR::html_dependency_react()),
    list(reactR::html_dependency_reacttools()),
    htmlwidgets::getDependency("dataui","dataui")
  )

  # if tag use attachDependencies
  if (inherits(tag_htmlwidget, c("shiny.tag", "shiny.tag.list", "html"))) {
    return(
      htmltools::attachDependencies(
        tag_htmlwidget,
        dui_deps
      )
    )
  }

  # if htmlwidget then append to $dependencies
  if(inherits(tag_htmlwidget, "htmlwidget")) {
    deps <- tag_htmlwidget$dependencies
    tag_htmlwidget$dependencies <- c(
      deps,
      dui_deps
    )
    tag_htmlwidget
  }
}

#' Character Version of 'data-ui'
#'
#' Create a character version of interactive 'data-ui'
#' for use with other 'htmlwidgets', such as tables or tags.
#'
#' @param dui \code{data-ui} htmlwidget to convert to character
#'
#' @import htmlwidgets htmltools
#' @export
#' @seealso \code{\link{dui_add_deps}}
#' @example inst/examples/example_tables.R
dui_chr <- function(dui){
  htmltools::HTML(as.character(
    as.tags(dui)
  ))
}
