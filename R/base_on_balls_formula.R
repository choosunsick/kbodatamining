#' Base on balls count
#'
#' Counting base on balls from data
#'
#' @param data KBO batter data
#' @return base on balls from data
#' @importFrom dplyr select
#' @examples
#' bb_formula(hanhwa_batter_2018)
#' @export
bb_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"30")+factor_count(data,"32"))
}
