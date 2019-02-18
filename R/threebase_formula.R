#' 3B calculate function
#'
#' count Triples of player
#'
#' @param data batter inning data
#' @return the number of 3B
#' @importFrom dplyr select
#' @examples
#' ## internal function
#' #threebase_formula(hanhwa_batter_2018)
threebase_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"12"))
}
