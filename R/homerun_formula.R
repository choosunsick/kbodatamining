#' Homerun calculate function
#'
#' count Homerun of player
#'
#' @param data batter inning data
#' @return the number of Homerun
#' @importFrom dplyr select
#' @examples
#' ## internal function
#' #homerun_formula(hanhwa_batter_2018)
homerun_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"13"))
}
