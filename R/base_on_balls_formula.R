#' Homerun calculate function
#'
#' count base on balls of player
#'
#' @param data batter inning data
#' @return the number of base on balls
#' @importFrom dplyr select
#' @examples
#' ## internal function
#' #threebase_formula(hanhwa_batter_2018)
bb_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"30")+factor_count(data,"32"))
}
