#' Recurse Over Nested Lists
#'
#' Like \code{rapply} but recurses over nested lists and
#' retain \code{attributes} and \code{names}.
#'
#' @param l \code{list} over which we would like to recurse
#' @param func \code{function} to apply to the list
#' @param ... arguments for the \code{func}
#'
#' @keywords internal
recurse <- function(l, func, ...) {
  l <- func(l, ...)
  if(is.list(l) && length(l)>0){
    lapply(
      l,
      function(ll){
        recurse(ll, func, ...)
      }
    )
  } else {
    l
  }
}

#' @keywords internal
enclose_jseval <- function(l) {
  # enclose jseval with {{!! and !!}}
  #  fairly crude hack and open to suggestions
  if(inherits(l, "JS_EVAL")) {
    l <- glue::glue("{{{{!!{code}!!}}}}", code = l)
  }
  return(l)
}

#' Convert 'dataui' to 'reactable' Custom Render Function
#'
#' @param dui \code{dataui} htmlwidget to convert
#'
#' @return \code{htmlwidgets::JS} of class \code{JS_EVAL}
#' @export
#'
#' @examples
#' if(requireNamespace("reactable")) {
#'   # create data frame with a list column
#'   df <- data.frame(x=1)
#'   df$x[1] <- list(1:10)
#'   dui_add_reactable_dep(
#'     reactable::reactable(
#'       df,
#'       columns = list(
#'         x = reactable::colDef(
#'           cell = dui_for_reactable(dui_sparkline(
#'             data = htmlwidgets::JS("cellInfo.value"),
#'             components=list( dui_sparklineseries() )
#'           )
#'         ))
#'       )
#'     )
#'   )
#' }
dui_for_reactable <- function(dui, jsarg = "cellInfo") {
  # enclose all htmlwidgets::JS with {{!! !!}}
  dui <- recurse(dui, enclose_jseval)
  # once converted to JSON remove "{!! and !!}"
  dui_js <- gsub(
    x = jsonlite::toJSON(
      dui$x$tag,
      force = TRUE,
      auto_unbox = TRUE
    ),
    pattern = "(\"\\{\\{!!)|(!!\\}\\}\")",
    replacement = "",
    perl = TRUE
  )

  # helpfully suggest to add dataui js dependency if this function is used
  message("
For this to work, please add the dataui dependency to your reactable instance.
dui_add_reactable_dep(...reactable widget...)
  ")

  # return a function with argument cellInfo
  htmlwidgets::JS(htmltools::HTML(
    gsub(
      x = glue::glue(
"
function({jsarg}) {{
  var spk = {dui_js}
  return window.reactR.hydrate(dataui, spk);
}}
",
        jsarg = jsarg,
        dui_js = dui_js
      ),
      pattern = "(\\\\n)",
      replacement = "\n"
    )
  ))
}


#' Add 'dataui' Dependency to 'reactable'
#'
#' @param rt \code{reactable} htmlwidget
#'
#' @return \code{reactable} htmlwidget with 'dataui' dependency attached
#' @export
#'
#' @examples
#' if(requireNamespace("reactable")) {
#'    dui_add_reactable_dep(reactable(mtcars))
#' }
dui_add_reactable_dep <- function(rt) {
  if(!inherits(rt,"reactable") && !inherits(rt,"htmlwidget")) {
    stop("Please supply a reactable or htmlwidget as the rt argument to this function.")
  }
  dep <- rt$dependencies
  if(!is.list(dep)) dep <- list()
  dep[[length(dep) + 1]] <- html_dependency_dataui()
  rt$dependencies <- dep
  rt
}
