#' Intentional base on ball calculate function
#'
#' Calculates intentional base on balls in the data.
#'
#' @param data batter inning data
#' @return Ibb counts from data
#' @importFrom dplyr select
#' @examples
#' ibb_formula(hanhwa_batter_2018)
#' @export
ibb_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"32"))
}
