#' Pitches per inning pitched calculate function
#'
#' Calculate P/IP in the data
#'
#' @param data KBO pitcher data
#' @return data's P/IP
#' @examples
#' p_ip_formula(hanhwa_pitcher_2018)
#' @export
p_ip_formula <- function(data){
  ip <- ip_formula(data)
  pit <- sum(data$pit)
  p_ip <- ifelse(ip != 0,pit/ip,99.99)
  return(p_ip)
}
