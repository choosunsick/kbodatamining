#' Comparing batter stats of two team during one season
#'
#' A plotting function that compares the batter stat of two teams during one season
#' This function has options called 'yearly' or 'monthly'.
#' default: the yearly parameter is 2018, the monthly parameter is NULL.
#' If you put a year in the yearly parameter, you draw a hit comparison plot of the two teams for that year.
#' If you put a month in the monthly parameter, you draw a hit comparison plot of the two teams for the matched 2018 year and specific month.
#' If you put a year and a month in each parameters, you draw a hit comparison plot of the two teams for the matched specific year and month.
#' If you are using MAC and Hangeul fonts are broken, type `theme_set(theme_gray(base_family = "AppleGothic"))`
#' @param data Your data must include at least one season of KBO data.
#' @param team1 The first of the team you want to compare
#' @param team2 The second of the team you want to compare
#' @param yearly The default value is 2018. Possible values are specific year.
#' @param monthly The default value is NULL. Possible values are specific month.
#' @return Plot to compare batting records of two teams
#' @examples
#' ##notrun
#' ## default: yearly=2018, monthly=NULL
#' #compare_batter_of_teams(KBO_full_data,"한화","LG",yearly=2018,monthly=NULL)
#' ## yearly=2018, monthly="05"
#' #compare_batter_of_teams(KBO_full_data,"한화","LG",yearly=2018,monthly="05")
#' @export

compare_batter_of_teams <- function(data,team1,team2,yearly=2018,monthly=NULL){
  data <- data[substr(data$date,1,4)==yearly,]
  data <- make_all_batter_data(data,team1,team2,yearly,monthly)
  plot <- team_batter_compare_plot(data)
  return(plot)
}
