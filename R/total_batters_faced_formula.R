#' Total Batters Faced calculate function
#'
#' Calculate TBF of player
#'
#' @param data KBO pitcher data
#' @return player TBF
#' @examples
#' ## internal function
#' #tbf_formula(hanhwa_pitcher_2018)
tbf_formula <- function(data){
  tbf <- sum(data$tbf)
  return(tbf)
}
