#' AVG calculate formula
#'
#' AVG calculate function
#'
#' @param data batter record data
#' @return calculate AVG
#' @examples
#' ## internal function
#' #avg_formula(hanhwa_batter_2018)

avg_formula <- function(data){
  return(sum(data$h)/sum(data$ab))
}
