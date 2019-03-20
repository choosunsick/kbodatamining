#' Intentional Base on Balls count
#'
#' Counting Intentional Base on Balls from data.
#'
#' @param data KBO batter data
#' @return IBB from data
#' @importFrom dplyr select
#' @examples
#' ibb_formula(hanhwa_batter_2018)
#' @export
ibb_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"32"))
}
