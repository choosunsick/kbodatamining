#' Pitches per inning pitched calculate function
#'
#' Calculate P/IP of player
#'
#' @param data KBO pitcher data
#' @return player P/IP
#' @examples
#' ## internal function
#' #p_ip_formula(hanhwa_pitcher_2018)
p_ip_formula <- function(data){
  ip <- ip_formula(data)
  pit <- pit_formula(data)
  p_ip <- ifelse(ip !=0,pit/ip,99.99)
  return(p_ip)
}
