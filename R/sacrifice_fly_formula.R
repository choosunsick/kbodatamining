#' Sacrifice Fly formula
#'
#' Calculating Sacrifice Fly from data
#'
#' @param data KBO batter data
#' @return Sacrifice Fly from data
#' @importFrom dplyr select
#' @examples
#' sf_formula(hanhwa_batter_2018)
#' @export
sf_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"50"))
}
