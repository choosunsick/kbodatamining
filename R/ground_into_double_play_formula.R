#' Ground into double play calculate function
#'
#' It is calculated as double play record of data..
#'
#' @param data KBO batter inning data
#' @return data's GIDP
#' @importFrom dplyr select
#' @examples
#' gidp_formula(hanhwa_batter_2018)
#' @export
gidp_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"72"))
}
