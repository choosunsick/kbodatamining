#' Slugging Average formula
#'
#' Calculating Slugging Average from data
#'
#' @param data KBO batter data
#' @return Slugging Average from data
#' @importFrom dplyr select
#' @examples
#' slg_formula(hanhwa_batter_2018)
#' @export
slg_formula <- function(data){
  numerator <- 1*onebase_formula(data)+2*twobase_formula(data)+3*threebase_formula(data)+4*homerun_formula(data)
  slg <- ifelse(sum(data$ab)>0,numerator/sum(data$ab),0)
  return(slg)
}
