#' Earned run average calculate function
#'
#' Calculate ERA of player
#'
#' @param data KBO pitcher data
#' @return player ERA
#' @examples
#' ## internal function
#' #era_formula(hanhwa_pitcher_2018)
era_formula <- function(data){
  denominator <- sum(data$inning, data$restinning/3)
  era <- ifelse(denominator!= 0,sum(data$er*9) /denominator,99.99)
  return(era)
}
