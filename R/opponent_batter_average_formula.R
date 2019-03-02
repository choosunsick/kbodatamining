#' Opponent batter average calculate function
#'
#' Calculate OBA in the data
#'
#' @param data KBO pitcher data
#' @return data's OBA
#' @examples
#' oba_formula(hanhwa_pitcher_2018[hanhwa_pitcher_2018$team=="한화",])
#' @export
oba_formula <- function(data){
  oba <- sum(data$h)/sum(data$ab)
  return(oba)
}
