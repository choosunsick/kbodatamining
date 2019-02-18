#' Sacrifice hit calculate function
#'
#' count Sacrifice hit of player
#'
#' @param data batter inning data
#' @return the number of Sacrifice hit
#' @importFrom dplyr select
#' @examples
#' ## internal function
#' #hbp_formula(hanhwa_batter_2018)
sh_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"41")+factor_count(data,"61"))
}
