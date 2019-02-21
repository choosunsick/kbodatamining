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
  avg <- ifelse(sum(data$ab),sum(data$h)/sum(data$ab),0)
  return(avg)
}
