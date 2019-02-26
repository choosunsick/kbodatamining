#' K/9 calculate function
#'
#' Calculate K/9 of player
#'
#' @param data KBO pitcher data
#' @return player K/9
#' @examples
#' ## internal function
#' #k_9_formula(hanhwa_pitcher_2018)
k_9_formula <- function(data){
  k_9 <- ifelse(ip_formula(data)>0,sum(data$k)*9/ip_formula(data),0)
  return(k_9)
}
