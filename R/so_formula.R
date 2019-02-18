#' SO calculate formula
#'
#' SO calculate function
#'
#' count SO of player
#'
#' @param data batter inning data
#' @return count SO
#' @importFrom dplyr select
#' @examples
#' ## internal function
#' #so_formula(hanhwa_batter_2018)
so_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(sum(factor_count(data,"20"),factor_count(data,"21")))
}
