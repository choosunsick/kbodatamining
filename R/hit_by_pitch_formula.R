#' Hit By Pitch count
#'
#' Counting Hit By Pitch from data
#'
#' @param data KBO batter data
#' @return Hit By Pitch from data
#' @importFrom dplyr select
#' @examples
#' hbp_formula(hanhwa_batter_2018)
#' @export
hbp_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"31"))
}
