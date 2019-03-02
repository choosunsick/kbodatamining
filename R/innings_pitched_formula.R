#' Innings pitched calculate function
#'
#' Calculates innings pitched in the data.
#'
#' @param data KBO pitcher data
#' @return data's IP
#' @examples
#' ip_formula(hanhwa_pitcher_2018)
#' @export
ip_formula <- function(data){
  ip <- sum(data$inning, data$restinning/3)
  return(ip)
}
