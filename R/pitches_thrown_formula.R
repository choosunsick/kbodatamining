#' The number of Pitches thrown calculate function
#'
#' Calculate PIT of player
#'
#' @param data KBO pitcher data
#' @return player PIT
#' @examples
#' ## internal function
#' #pit_formula(hanhwa_pitcher_2018)
pit_formula <- function(data){
  pit <- sum(data$pit)
  return(pit)
}
