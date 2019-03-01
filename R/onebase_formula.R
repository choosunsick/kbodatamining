#' 1B calculating function
#'
#' Calculates the player's single hit.
#'
#' @param data batter inning data
#' @return player 1B
#' @importFrom dplyr select
#' @examples
#' onebase_formula(hanhwa_batter_2018)
#' @export

onebase_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"10"))
}
