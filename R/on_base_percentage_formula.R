#' On-base Percentage formula
#'
#' Calculating OBP from data
#'
#' @param data KBO batter data
#' @return OBP from data
#' @examples
#' obp_formula(hanhwa_batter_2018)
#' @export
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
