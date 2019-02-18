#' Intentional base on ball calculate function
#'
#' count intentional base on balls of player
#'
#' @param data batter inning data
#' @return the number of intentional base on balls
#' @importFrom dplyr select
#' @examples
#' ## internal function
#' #ibb_formula(hanhwa_batter_2018)
ibb_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"32"))
}
