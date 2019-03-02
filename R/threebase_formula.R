#' 3B calculate function
#'
#' Calculates the data's Triples.
#'
#' @param data batter inning data
#' @return data's 3B
#' @importFrom dplyr select
#' @examples
#' threebase_formula(hanhwa_batter_2018)
#' @export
threebase_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"12"))
}
