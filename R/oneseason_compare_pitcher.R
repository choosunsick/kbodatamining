#' Plot comparing two pitcher stats with one season
#'
#' This function draws a plot that compares two pitchers based on one season batter data.
#' This function has an option for yearly and monthly.
#' default: Based on the 2018 season, the month argument is NULL
#' If you put specific year in the yearly parameter, draws a batting comparison plot for the matched year.
#' If you put specific month in the monthly parameter,
#' draws a pitching comparison plot for the matched 2018 year and specific month.
#' If you put specific year and month in two parameters,
#' draws a pitching comparison plot for the matched specific year and month.
#' @param data Default data is hanhwa_pitcher_2018 You can put other kbo batter data if you want.
#' @param playername1 Name of the pitcher you want to compare
#' @param playername2 Name of the pitcher you want to compare
#' @param yearly The default value is NULL Possible values are a specific year.
#' @param monthly The default value is NULL Possible values are a specific month.
#' @return Plots comparing two pitcher stats per year
#' @examples
#' ## default: yearly=2018, monthly=NULL
#' oneseason_compare_pitcher(hanhwa_pitcher_2018,"정우람","이태양",yearly=2018)
#' ## yearly=2018, monthly="05"
#' oneseason_compare_pitcher(hanhwa_pitcher_2018,"정우람","이태양",yearly=2018,monthly="05")
#' @export

oneseason_compare_pitcher <- function(data=kbodatamining::hanhwa_pitcher_2018,playername1,playername2,yearly=2018,monthly=NULL){
  data <- make_pitcher_data(data,playername1,playername2,yearly,monthly)
  plot <- oneyear_pitcher_plot(data)
  return(plot)
}
