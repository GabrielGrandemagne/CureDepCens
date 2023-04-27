#' Plot the survival function
#'
#' @aliases plot_cure
#' @export
#' @description This graph helps to visualize the survival function.
#' @param object an object of the class "dcensoring".
#' @param scenario which defines the scenario in the graph (t: failure times, c: dependent censoring times, or both).
#' @details In order to smooth the line presented in the graph, we used the 'lowess' function. So, it can result in a non-monotonous survival function.
#' @return a survival function graph of the fitted model.
#'
#' @examples
#' \donttest{
#' fit <- cure_dep_censoring(formula = time ~ x1_cure + x_c1 + x_c2 | x_c1 + x_c2,
#'                                      data = simula_fracur,
#'                                      delta_t = simula_fracur$delta_t,
#'                                      delta_c = simula_fracur$delta_c,
#'                                      ident = simula_fracur$ident,
#'                                      dist = "weibull")
#' plot_cure(fit, scenario = "both")
#'}
#'
plot_cure <- function(object, scenario  = c("t", "c", "both")){

  scenario  <- match.arg(scenario)

  bmax <- object$bmax
  #Caso MEP
  if (is.null(bmax) == FALSE){
    switch(scenario ,
           "t" = invisible(plot.mep.t(object)),
           "c" = invisible(plot.mep.c(object)),
           "both"= invisible(plot.mep.t(object) + plot.mep.c(object)))
  }

  #Caso Weibull
  else{
    switch(scenario ,
           "t" = invisible(plot.weibull.t(object)),
           "c" = invisible(plot.weibull.c(object)),
           "both"= invisible(plot.weibull.t(object) + plot.weibull.c(object)))
  }
}
