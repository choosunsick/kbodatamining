#' avg calculate formula
#'
#' only calculate function
#'
#' @param h hit record data
#' @param ab at bat record data
#' @return calculate avg
#' @examples
#' ## internal function
#' #avg_formula(h,ab)

avg_formula <- function(h,ab){
  return(sum(h)/sum(ab))
}
