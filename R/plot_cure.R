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
#' \dontrun{
#' Dogs_MimicData <- Dogs_MimicData %>%
#'  mutate(
#'  delta_t = ifelse(Dogs_MimicData$cens==1,1,0),
#'  delta_c = ifelse(Dogs_MimicData$cens==2,1,0)
#')
#' fit_Weibull <- cure_dep_censoring(formula = time ~ x1_cure + x2_cure | x_c1 + x_c2,
#'                                      data = Dogs_MimicData,
#'                                      delta_t = Dogs_MimicData$delta_t,
#'                                      delta_c = Dogs_MimicData$delta_c,
#'                                      ident = Dogs_MimicData$ident,
#'                                      dist = "weibull")
#' plot_cure(fit_Weibull, scenario = "t")
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
