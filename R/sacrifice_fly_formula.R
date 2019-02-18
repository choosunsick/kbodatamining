#' Sacrifice hit calculate function
#'
#' count Sacrifice fly of player
#'
#' @param data batter inning data
#' @return the number of Sacrifice fly
#' @importFrom dplyr select
#' @examples
#' ## internal function
#' #sf_formula(hanhwa_batter_2018)
sf_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"50"))
}
