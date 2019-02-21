#' Ground into double play calculate function
#'
#' Count Ground into double play of player
#'
#' @param data batter inning data
#' @return the number of Ground into double play
#' @importFrom dplyr select
#' @examples
#' ## internal function
#' #gidp_formula(hanhwa_batter_2018)
gidp_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"72"))
}
