#' Sacrifice Hit formula
#'
#' Calculating Sacrifice Hit from data
#'
#' @param data KBO batter data
#' @return Sacrifice Hit from data
#' @importFrom dplyr select
#' @examples
#' sh_formula(hanhwa_batter_2018)
#' @export
sh_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"41")+factor_count(data,"61"))
}
