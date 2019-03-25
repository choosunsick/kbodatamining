#' Earned Run Average count
#'
#' Counting ERA from the data
#'
#' @param data KBO pitcher data
#' @return ERA from data
#' @examples
#' era_formula(hanhwa_pitcher_2018)
#' @export

era_formula <- function(data){
  ip <- sum(data$inning, data$restinning/3)
  era <- ifelse(ip> 0,sum(data$er*9) /ip,ifelse(sum(data$er)==0,0,99.99))
  return(round(era,3))
}
