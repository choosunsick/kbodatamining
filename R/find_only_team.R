#' Extracting only one team data
#'
#' find_only_team function creates data that contains only the teams you want.
#'
#' @param data KBO data with players from different teams
#' @param teamname The teamname you want to find
#' @return The batter data only the team you want to find
#' @examples
#' find_only_team(hanhwa_batter_2018,"한화")
#' @export
# teamname is string type and only korean baseball team name forexample "한화"
find_only_team <- function(data,teamname){
  onlyteamdata <- data[data$team == teamname,]
  return(onlyteamdata)
}
