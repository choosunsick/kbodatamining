#' Plot comparing two batter stats with one season
#'
#' This function draws a plot that compares two batters based on one season batter data.
#' This function has an option for yearly and monthly.
#' default: Based on the 2018 season, the month argument is NULL
#' If you put specific year in the yearly parameter, draws a batting comparison plot for the matched year.
#' If you put specific month in the monthly parameter,
#' draws a batting comparison plot for the matched 2018 year and specific month.
#' If you put specific year and month in two parameters,
#' draws a batting comparison plot for the matched specific year and month.
#' If you are using mac and Hangul fonts are broken, type `theme_gray (base_family = "AppleGothic"))`
#' @param data Default data is hanhwa_batter_2018 You can put other kbo batter data if you want.
#' @param playername1 Name of the batter you want to compare
#' @param playername2 Name of the batter you want to compare
#' @param yearly The default value is 2018 Possible values are a specific year.
#' @param monthly The default value is NULL Possible values are a specific month.
#' @return Plots comparing two batter stats per year
#' @examples
#' ## default: yearly=2018, monthly=NULL
#' oneseason_compare_batter(hanhwa_batter_2018,"이용규","정근우",yearly=2018)
#' ## yearly=2018, monthly="05"
#' oneseason_compare_batter(hanhwa_batter_2018,"이용규","정근우",yearly=2018,monthly="05")
#' @export

oneseason_compare_batter <- function(data=kbodatamining::hanhwa_batter_2018,playername1,playername2,yearly=2018,monthly=NULL){
  data <- make_batter_data(data,playername1,playername2,yearly,monthly)
  plot <- oneyear_batter_plot(data)
  return(plot)
}
