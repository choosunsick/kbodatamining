#' Homerun calculate function
#'
#' Calculates Homerun in the data.
#'
#' @param data batter inning data
#' @return player's Homerun
#' @importFrom dplyr select
#' @examples
#' homerun_formula(hanhwa_batter_2018)
#' @export
homerun_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"13"))
}
