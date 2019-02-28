#' Intentional base on ball calculate function
#'
#' Calculates intentional base on balls in the data.
#'
#' @param data batter inning data
#' @return The intentional base on balls number of the player
#' @importFrom dplyr select
#' @examples
#' ## internal function
#' #ibb_formula(hanhwa_batter_2018)
ibb_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"32"))
}
