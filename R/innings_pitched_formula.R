#' Innings Pitched formula
#'
#' Calculating Innings Pitched from data.
#'
#' @param data KBO pitcher data
#' @return IP from data
#' @examples
#' ip_formula(hanhwa_pitcher_2018)
#' @export
ip_formula <- function(data){
  ip <- sum(data$inning, data$restinning/3)
  return(ip)
}
