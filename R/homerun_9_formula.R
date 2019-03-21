#' Homerun / 9 formula
#'
#' Calculating Homerun / 9 from data
#'
#' @param data KBO pitcher data
#' @return  HR / 9 from data
#' @examples
#' hr_9_formula(hanhwa_pitcher_2018)
#' @export
hr_9_formula <- function(data){
  ip <- sum(data$inning, data$restinning/3)
  hr_9 <- ifelse(ip>0,sum(data$hr)*9/ip,99.99)
  return(hr_9)
}
