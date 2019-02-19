#' Save calculate function
#'
#' Calculate SV of player
#'
#' @param data KBO pitcher data
#' @return player SV
#' @examples
#' ## internal function
#' #sv_formula(hanhwa_pitcher_2018)
sv_formula <- function(data){
  sv <- sum(data$sv)
  return(sv)
}
