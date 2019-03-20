#' Homerun / 9 formula
#'
#' Calculating Homerun / 9 from data
#'
#' @param data KBO pitcher data
#' @return  HR / 9 from data
#' @examples
#' hr_9_formula(find_team(hanhwa_pitcher_2018,"한화"))
#' @export
hr_9_formula <- function(data){
  hr_9 <- ifelse(ip_formula(data)>0,sum(data$hr)*9/ip_formula(data),99.99)
  return(hr_9)
}
