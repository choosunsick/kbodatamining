#' Slugging average calculate function
#'
#' Calculate Slugging average in the data
#'
#' @param data batter inning data
#' @return data's Slugging average
#' @importFrom dplyr select
#' @examples
#' slg_formula(hanhwa_batter_2018)
#' @export
slg_formula <- function(data){
  numerator <- 1*onebase_formula(data)+2*twobase_formula(data)+3*threebase_formula(data)+4*homerun_formula(data)
  slg <- ifelse(sum(data$ab)>0,numerator/sum(data$ab),0)
  return(slg)
}
