#' Pitches Per Inning Pitched formula
#'
#' Calculating P/IP from data
#'
#' @param data KBO pitcher data
#' @return P/IP from data
#' @examples
#' p_ip_formula(hanhwa_pitcher_2018)
#' @export
p_ip_formula <- function(data){
  ip <- sum(data$inning, data$restinning/3)
  pit <- sum(data$pit)
  p_ip <- ifelse(ip != 0,pit/ip,99.99)
  return(round(p_ip,3))
}
