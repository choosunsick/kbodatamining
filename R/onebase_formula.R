#' 1B calculate function
#'
#' count single hit of player
#'
#' @param data batter inning data
#' @return the number of 1B
#' @importFrom dplyr select
#' @examples
#' ## internal function
#' #onebase_formula(hanhwa_batter_2018)
onebase_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"10"))
}
