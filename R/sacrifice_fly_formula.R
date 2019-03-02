#' Sacrifice fly calculate function
#'
#' Calculate Sacrifice fly in the data
#'
#' @param data batter inning data
#' @return data's Sacrifice fly
#' @importFrom dplyr select
#' @examples
#' sf_formula(hanhwa_batter_2018)
#' @export
sf_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"50"))
}
