#' Ground Into Double Play count
#'
#' Counting GIDP from the data
#'
#' @param data KBO batter data
#' @return GIDP from the data
#' @importFrom dplyr select
#' @examples
#' gidp_formula(hanhwa_batter_2018)
#' @export
gidp_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"72"))
}
