#' Base on balls calculate function
#'
#' Calculates base on balls from data
#'
#' @param data KBO batter inning data
#' @return the number of base on balls
#' @importFrom dplyr select
#' @examples
#' bb_formula(hanhwa_batter_2018)
#' @export
bb_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"30")+factor_count(data,"32"))
}
