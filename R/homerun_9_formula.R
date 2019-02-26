#' Homerun / 9 calculate function
#'
#' Calculate HR / 9 of player
#'
#' @param data KBO pitcher data
#' @return player HR / 9
#' @examples
#' ## internal function
#' #hr_9_formula(hanhwa_pitcher_2018[hanhwa_pitcher_2018$team=="한화",])
hr_9_formula <- function(data){
  hr_9<- ifelse(ip_formula(data)>0,sum(data$hr)*9/ip_formula(data),99.99)
  return(hr_9)
}
