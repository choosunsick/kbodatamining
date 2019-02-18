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
  numerator <- sum(data$ab,bb_formula(data),hbp_formula(data))
  if(numerator!=0){
    obp <- numerator/sum(numerator,sf_formula(data))
  }
  else{
    obp <- 0
  }
  return(obp)
}
