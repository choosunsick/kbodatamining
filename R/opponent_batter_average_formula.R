#' Opponent batter average calculate function
#'
#' Calculate OBA of player
#'
#' @param data KBO pitcher data
#' @return player OBA
#' @examples
#' ## internal function
#' #oba_formula(hanhwa_pitcher_2018[hanhwa_pitcher_2018$team=="한화",])
oba_formula <- function(data){
  oba <- sum(data$h)/sum(data$ab)
  return(oba)
}
