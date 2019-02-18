#' 2B calculate function
#'
#' count Double of player
#'
#' @param data batter inning data
#' @return the number of 2B
#' @importFrom dplyr select
#' @examples
#' ## internal function
#' #twobase_formula(hanhwa_batter_2018)
twobase_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"11"))
}
