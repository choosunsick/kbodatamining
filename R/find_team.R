#' Extracting team data
#'
#' find_team function creates data that contains team you want.
#'
#' @param data KBO data with playername
#' @param team The team you want to find
#' @return The batter data only the team you want to find
#' @examples
#' find_team(hanhwa_batter_2018,"이용규")
#' @export
find_team <- function(data,team){
  team_data <- data[data$team == team,]
  if(NROW(team_data)==0){
    warning("There is no data for team.")
  }
  return(team_data)
}
