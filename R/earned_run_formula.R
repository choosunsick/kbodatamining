#' Earned run calculate function
#'
#' Calculate ER of player
#'
#' @param data KBO pitcher data
#' @return player ER
#' @examples
#' ## internal function
#' #er_formula(hanhwa_pitcher_2018)
er_formula <- function(data){
  er <- sum(data$er)
  return(er)
}
