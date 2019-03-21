#' K/9 formula
#'
#' Calculating K/9 from data.
#'
#' @param data KBO pitcher data
#' @return K/9 from data
#' @examples
#' k_9_formula(hanhwa_pitcher_2018)
#' @export
k_9_formula <- function(data){
  ip <- sum(data$inning, data$restinning/3)
  k_9 <- ifelse(ip>0,sum(data$k)*9/ip,0)
  return(k_9)
}
