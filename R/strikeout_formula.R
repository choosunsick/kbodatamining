#' K calculate function
#'
#' Calculate K of player
#'
#' @param data KBO pitcher data
#' @return player K
#' @examples
#' ## internal function
#' #k_formula(hanhwa_pitcher_2018)
k_formula <- function(data){
  k <- sum(data$k)
  return(k)
}
