#' Earned run average calculate function
#'
#' Calculates the ERA of the pitcher from the data
#'
#' @param data KBO pitcher data
#' @return data's ERA
#' @examples
#' era_formula(hanhwa_pitcher_2018)
#' @export

era_formula <- function(data){
  denominator <- sum(data$inning, data$restinning/3)
  era <- ifelse(denominator!= 0,sum(data$er*9) /denominator,99.99)
  return(era)
}
