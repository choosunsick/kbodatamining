#' Homerun allowed calculate function
#'
#' Calculate HRA of player
#'
#' @param data KBO pitcher data
#' @return player HRA
#' @examples
#' ## internal function
#' #hra_formula(hanhwa_pitcher_2018)
hra_formula <- function(data){
  hr <- sum(data$hr)
  return(hr)
}
