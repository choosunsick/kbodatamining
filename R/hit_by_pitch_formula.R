#' Hit by pitch calculate function
#'
#' Calculates the Hit by pitch record in the data.
#'
#' @param data batter inning data
#' @return data's Hit by pitch
#' @importFrom dplyr select
#' @examples
#' hbp_formula(hanhwa_batter_2018)
#' @export
hbp_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(factor_count(data,"31"))
}
