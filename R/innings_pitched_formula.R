#' Innings pitched calculate function
#'
#' Calculate IP of player
#'
#' @param data KBO pitcher data
#' @return player IP
#' @examples
#' ## internal function
#' #ip_formula(hanhwa_pitcher_2018)
ip_formula <- function(data){
  ip <- sum(data$inning, data$restinning/3)
  return(ip)
}
