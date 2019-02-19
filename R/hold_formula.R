#' HOLD calculate function
#'
#' Calculate HLD of player
#'
#' @param data KBO pitcher data
#' @return player HLD
#' @examples
#' ## internal function
#' #hld_formula(hanhwa_pitcher_2018)
hld_formula <- function(data){
  hld <- sum(data$hld)
  return(hld)
}
