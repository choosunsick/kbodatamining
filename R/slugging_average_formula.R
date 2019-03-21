#' Slugging Average formula
#'
#' Calculating Slugging Average from data
#'
#' @param data KBO batter data
#' @return Slugging Average from data
#' @examples
#' slg_formula(hanhwa_batter_2018)
#' @export
slg_formula <- function(data){
  numerator <- 1*factor_count(data,"10")+2*factor_count(data,"11")+3*factor_count(data,"12")+4*factor_count(data,"13")
  slg <- ifelse(sum(data$ab)>0,numerator/sum(data$ab),0)
  return(slg)
}
