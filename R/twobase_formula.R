#' 2B calculate function
#'
#' Calculates the data's Double
#'
#' @param data batter inning data
#' @return data's 2B
#' @importFrom dplyr select
#' @examples
#' twobase_formula(hanhwa_batter_2018)
#' @export
twobase_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"11"))
}
