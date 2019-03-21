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
  bb <- factor_count(data,"30")+factor_count(data,"32")
  hbp <- factor_count(data,"31")
  sf <- factor_count(data,"50")
  denominator <- sum(sum(data$ab),bb,hbp,sf)
  obp <- ifelse(denominator>0, sum(sum(data$h),bb,hbp)/denominator,0)
  return(obp)
}
