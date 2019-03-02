#'  Winning Percentage(WPCT) calculate function
#'
#' Calculate WPCT in the data
#'
#' @param data KBO pitcher data
#' @return data's WPCT
#' @examples
#' wpct_formula(hanhwa_pitcher_2018)
#' @export
wpct_formula <- function(data){
  wl <- sum(data$win,data$lose)
  wpct <- ifelse(wl!=0,sum(data$win)/wl,0)
  return(wpct)
}
