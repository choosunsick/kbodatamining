#' Comparison between two teams' batters plot
#'
#' A plotting function that compares the hits of two teams
#' This function has an option for yearly and monthly.
#' default: Based on the 2018 season, the month argument is NULL
#' If you put a specific year in the year parameter, you draw a hit comparison plot of the two teams for that year.
#' If you put specific month in the monthly parameter, draws a hit comparison plot of the two teams for the matched 2018 year and specific month.
#' If you put specific year and month in two parameters, draws a hit comparison plot of the two teams for the matched specific year and month.
#' If you are using mac and Hangul fonts are broken, type `theme_set(theme_gray(base_family = "AppleGothic"))`
#' @param data Data must contain at least one season of KBO game data
#' @param team1 Name of the batter's team you want to compare
#' @param team2 Name of the batter's team you want to compare
#' @param yearly The default value is 2018 Possible values are a specific year.
#' @param monthly The default value is NULL Possible values are a specific month.
#' @return Plot to compare batting records of two teams
#' @examples
#' ##notrun
#' ## default: yearly=2018, monthly=NULL
#' #compare_two_team_batter(KBO_full_data,"한화","LG",yearly=2018)
#' ## yearly=2018, monthly="05"
#' #compare_two_team_batter(KBO_full_data,"한화","LG",yearly=2018,monthly="05")
#' @export

compare_two_team_batter <- function(data,team1,team2,yearly=2018,monthly=NULL){
  data <- make_all_batter_data(data,team1,team2,yearly,monthly)
  plot <- team_batter_compare_plot(data)
  return(plot)
}
