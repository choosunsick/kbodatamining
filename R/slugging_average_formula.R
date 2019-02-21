#' Slugging average calculate function
#'
#' Calculate Slugging average of player
#'
#' @param data batter inning data
#' @return player Slugging average
#' @importFrom dplyr select
#' @examples
#' ## internal function
#' #obp_formula(hanhwa_batter_2018)
slg_formula <- function(data){
  numerator <- 1*onebase_formula(data)+2*twobase_formula(data)+3*threebase_formula(data)+4*homerun_formula(data)
  slg <- ifelse(sum(data$ab)>0,numerator/sum(data$ab),0)
  return(slg)
}
