#' Hit by pitch calculate function
#'
#' count Hit by pitch of player
#'
#' @param data batter inning data
#' @return the number of  Hit by pitch
#' @importFrom dplyr select
#' @examples
#' ## internal function
#' #hbp_formula(hanhwa_batter_2018)
hbp_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"31"))
}
