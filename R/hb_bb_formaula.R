#' HB(Hit batsman)+BB+IBB calculate function
#'
#' Calculate HB+BB+IBB of player
#'
#' @param data KBO pitcher data
#' @return player HB+BB+IBB
#' @examples
#' ## internal function
#' #pit_formula(hanhwa_pitcher_2018)
hb_bb_formula <- function(data){
  bb <- sum(data$bb)
  return(bb)
}
