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
  k_9 <- ifelse(ip_formula(data)>0,sum(data$k)*9/ip_formula(data),0)
  return(k_9)
}
