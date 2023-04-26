#---------------------------------------------

#' Print the summary output
#'
#' @export
#' @param object an object of the class "dcensoring".
#' @param ... further arguments passed to or from other methods.
#' @return a summary of the fitted model.
#'
#' @examples
#' \donttest{
#' fit_frasurv_MEP <- cure_dep_censoring(formula = time ~ x1_cure + x_c1 + x_c2 | x_c1 + x_c2,
#'                                      data = simula_fracur,
#'                                      delta_t = simula_fracur$delta_t,
#'                                      delta_c = simula_fracur$delta_c,
#'                                      ident = simula_fracur$ident,
#'                                      dist = "MEP")
#' summary_cure(fit_frasurv_MEP)
#'}
summary_cure <- function(object, ...){

  bmax <- object$bmax

  if (is.null(bmax) == FALSE){
    p <- object$p-1
    q <- object$q
    crits <- object$crit
    pvalues <- object$pvalue
    Xlabels <- object$labels2[c(-1)]
    Zlabels <- object$labels1

    cat("\n")
    cat("MEP approach")
    cat("\n")
    cat("\n")
    cat("Name\t","Estimate\t","Std. Error\t","CI INF \t","CI SUP\t","\t","p-value\t","\n")
    cat("Alpha", format(object[[1]][1],nsmall=6), format(object[[2]][c(2*p+q+2)], nsmall=6), format((object[[1]][1] - 1.96*object[[2]][c(2*p+q+2)]),nsmall=6), format((object[[1]][1] + 1.96*object[[2]][c(2*p+q+2)]), nsmall=6),format(pvalues[1], digits = 4, nsmall = 3), sep = "\t", "\n" )
    cat("Theta", format(object[[1]][(p+q+3)],nsmall=6), format(object[[2]][length(object[[2]])], nsmall=6), pmax(format((object[[1]][(p+q+3)] - 1.96*object[[2]][length(object[[2]])]),nsmall=6), "0.000000"), format((object[[1]][(p+q+3)] + 1.96*object[[2]][length(object[[2]])]),nsmall=6), sep = "\t", "\n")
    cat("Interc", format(object[[1]][2],nsmall=6), format(object[[2]][1], nsmall=6), format((object[[1]][2] - 1.96*object[[2]][1]),nsmall=6), format((object[[1]][2] + 1.96*object[[2]][1]),nsmall=6), format(pvalues[2], digits = 4, nsmall = 3), sep = "\t", "\n")
    cat("\n")
    cat("Coefficients T:\n")
    cat("\n")
    cat("Name\t","Estimate\t","Std. Error\t","CI INF \t","CI SUP\t","\t","p-value\t","\n")
    for (i in 1:p){
      cat(substr(sub(".*\\$","", Xlabels[i]), 1, 6), format(object[[1]][c(2+i)],nsmall=6),format(object[[2]][c(1+i)],nsmall=6),format((object[[1]][c(2+i)] - 1.96*object[[2]][c(1+i)]),nsmall=6),format((object[[1]][c(2+i)] + 1.96*object[[2]][c(1+i)]),nsmall=6), format(pvalues[2+i], digits = 4, nsmall = 3),sep="\t","\n")
    }
    cat("\n")
    cat("Coefficients C:\n")
    cat("\n")
    cat("Name\t","Estimate\t","Std. Error\t","CI INF \t","CI SUP\t","\t","p-value\t","\n")
    for (j in 1:q){
      cat(substr(sub(".*\\$","", Zlabels[j]), 1, 6), format(object[[1]][c(2+p+j)],nsmall=6),format(object[[2]][c(2*p+1+j)],nsmall=6),format((object[[1]][c(2+p+j)] - 1.96*object[[2]][c(2*p+1+j)]),nsmall=6),format((object[[1]][c(p+2+j)] + 1.96*object[[2]][c(2*p+1+j)]),nsmall=6), format(pvalues[2+p+j], digits = 4, nsmall = 3),sep="\t","\n")
    }
    cat("\n")
    cat("----------------------------------------------------------------------------------")
    cat("\n")
    cat("\n")
    cat("Information criteria:")
    cat("\n")
    cat("\n")
    cat("AIC"," BIC","  HQ", sep = "\t", "\n")
    cat(crits, "\n")
    cat("\n")
  }
  else{
    p <- object$p-1
    q <- object$q
    crits <- object$crit
    pvalues <- object$pvalue
    Xlabels <- object$labels2[c(-1)]
    Zlabels <- object$labels1

    cat("\n")
    cat("Weibull approach")
    cat("\n")
    cat("\n")
    cat("Name\t","Estimate\t","Std. Error\t","CI INF \t","CI SUP\t","\t","p-value\t","\n")
    cat("Alpha",format(object[[1]][1],nsmall=6), format(object[[2]][(4+p+q)],nsmall=6), format((object[[1]][c(4+p+q)] - 1.96*object[[2]][c(4+p+q)]),nsmall=6),format((object[[1]][c(4+p+q)] + 1.96*object[[2]][c(4+p+q)]),nsmall=6), format(pvalues[1], digits = 4, nsmall = 3), sep = "\t", "\n" )
    cat("Theta",format(object[[1]][(6+p+q)],nsmall=6), format(object[[2]][(7+p+q)],nsmall=6), pmax(format((object[[1]][c(6+p+q)] - 1.96*object[[2]][c(6+p+q)]),nsmall=6), "0.000000"),format((object[[1]][c(6+p+q)] + 1.96*object[[2]][c(6+p+q)]),nsmall=6), sep = "\t", "\n" )
    cat("Interc", format(object[[1]][(2)],nsmall=6), format(object[[2]][(1)], nsmall=6), format((object[[1]][(1)] - 1.96*object[[1]][(1)]),nsmall=6), format((object[[1]][(1)] + 1.96*object[[1]][(1)]),nsmall=6),format(pvalues[2], digits = 4, nsmall = 3), sep = "\t", "\n")
    cat("\n")
    cat("Coefficients T:\n")
    cat("\n")
    cat("Name\t","Estimate\t","Std. Error\t","CI INF \t","CI SUP\t","\t","p-value\t","\n")
    for (i in 1:p){
      cat(substr(sub(".*\\$","", Xlabels[i]), 1, 6),format(object[[1]][c(2+i)],nsmall=6),format(object[[2]][c(1+i)],nsmall=6),format((object[[1]][c(1+i)] - 1.96*object[[2]][c(1+i)]),nsmall=6),format((object[[1]][c(1+i)] + 1.96*object[[2]][c(1+i)]),nsmall=6),format(pvalues[2+i], digits = 4, nsmall = 3), sep = "\t", "\n")
    }
    cat("\n")
    cat("Coefficients C:\n")
    cat("\n")
    cat("Name\t","Estimate\t","Std. Error\t","CI INF \t","CI SUP\t","\t","p-value\t","\n")
    for (j in 1:q){
      cat(substr(sub(".*\\$","", Zlabels[j]), 1, 6),format(object[[1]][c(3+p+j)],nsmall=6), format(object[[2]][c(3+p+j)],nsmall=6),format((object[[1]][c(3+p+j)] - 1.96*object[[2]][c(3+p+j)]),nsmall=6),format((object[[1]][c(3+p+j)] + 1.96*object[[2]][c(3+p+j)]),nsmall=6),format(pvalues[2+p+j], digits = 4, nsmall = 3), sep = "\t","\n")
    }
    cat("\n")
    cat("----------------------------------------------------------------------------------")
    cat("\n")
    cat("\n")
    cat("Information criteria:")
    cat("\n")
    cat("\n")
    cat("AIC"," BIC","  HQ", sep = "\t", "\n")
    cat(crits, "\n")
    cat("\n")
  }
}
