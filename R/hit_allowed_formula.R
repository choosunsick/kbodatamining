#' Hit allowed calculate function
#'
#' Calculate HA of player
#'
#' @param data KBO pitcher data
#' @return player HA
#' @examples
#' ## internal function
#' #ha_formula(hanhwa_pitcher_2018)
ha_formula <- function(data){
  h <- sum(data$h)
  return(h)
}
