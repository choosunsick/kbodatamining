#' 3B count
#'
#' Counting Triples from data
#'
#' @param data KBO batter data
#' @return 3B from data
#' @importFrom dplyr select
#' @examples
#' threebase_formula(hanhwa_batter_2018)
#' @export
threebase_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"12"))
}
