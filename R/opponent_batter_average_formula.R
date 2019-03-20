#' Opponent Batter Average formula
#'
#' Calculating OBA from data
#'
#' @param data KBO pitcher data
#' @return OBA from data
#' @examples
#' oba_formula(hanhwa_pitcher_2018[hanhwa_pitcher_2018$team=="한화",])
#' @export
oba_formula <- function(data){
  oba <- sum(data$h)/sum(data$ab)
  return(oba)
}
