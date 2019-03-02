#' StrikeOut(SO) calculate formula
#'
#' This function calculates the strikeout in which the baseball player was hit in the data.
#'
#' @param data batter inning data
#' @return data's SO
#' @importFrom dplyr select
#' @examples
#' so_formula(hanhwa_batter_2018)
#' @export
so_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  return(sum(factor_count(data,"20"),factor_count(data,"21")))
}
