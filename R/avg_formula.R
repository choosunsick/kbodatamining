#' AVG formula
#'
#' Calculating AVG from data
#'
#' @param data KBO batter data
#' @return AVG from data
#' @examples
#' avg_formula(hanhwa_batter_2018)
#' @export
avg_formula <- function(data){
  avg <- ifelse(sum(data$ab)>0,sum(data$h)/sum(data$ab),0)
  return(avg)
}
