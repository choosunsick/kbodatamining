#' A pitcher's winning percentage calculate function
#'
#' Calculate WPCT of player
#'
#' @param data KBO pitcher data
#' @return player WPCT
#' @examples
#' ## internal function
#' #wpct_formula(hanhwa_pitcher_2018)
wpct_formula <- function(data){
  wl <- sum(data$win,data$lose)
  wpct <- ifelse(wl!=0,sum(data$win)/wl,0)
  return(wpct)
}
