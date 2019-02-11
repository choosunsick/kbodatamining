#' Extracting only one team data
#'
#' find_only_team function creates data that contains only the teams you want.
#'
#' @param data KBO data with players from different teams
#' @param teamname The teamname you want to find
#' @return The batter data only the team you want to find

# teamname is string type and only korean baseball team name forexample "한화"
find_only_team <- function(data,teamname){
  onlyteamdata <- data[data$team == teamname,]
  return(onlyteamdata)
}
