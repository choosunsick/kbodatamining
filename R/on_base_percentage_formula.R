#' On-base percentage calculate function
#'
#' Calculate OBP of player
#'
#' @param data batter inning data
#' @return player OBP
#' @importFrom dplyr select
#' @examples
#' ## internal function
#' #obp_formula(hanhwa_batter_2018)
obp_formula <- function(data){
  denominator <- sum(sum(data$ab),bb_formula(data),hbp_formula(data),sf_formula(data))
  if(denominator>0){
    obp <- sum(sum(data$h),bb_formula(data),hbp_formula(data))/denominator
  }
  else{
    obp <- 0
  }
  return(obp)
}
