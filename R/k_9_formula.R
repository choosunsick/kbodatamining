#' K/9 calculate function
#'
#' Calculates K/9 in the data.
#'
#' @param data KBO pitcher data
#' @return data's K/9
#' @examples
#' k_9_formula(hanhwa_pitcher_2018)
#' @export
k_9_formula <- function(data){
  k_9 <- ifelse(ip_formula(data)>0,sum(data$k)*9/ip_formula(data),0)
  return(k_9)
}
