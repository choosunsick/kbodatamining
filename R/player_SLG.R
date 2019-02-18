#' Calculating batter's Slugging average
#'
#' This function calculates the Slugging average for the specified player.
#' This function has an option for yearly and monthly.
#' default: the annualy Slugging average is calculated
#' If you put a year in the yearly parameter, it calculates the corresponding year Slugging average.
#' If you put a month in the monthly parameter, it calculates the corresponding yearly-month Slugging average.
#' If you put a year and a month in two parameters, the Slugging average for the specific time you put in is calculated.
#' @param data Default data is hanhwa_batter_2018 You can put other kbo batter data if you want.
#' @param playername The name of the batter you want.
#' @param yearly The default value is NULL Possible values are a specific year.
#' @param monthly The default value is NULL Possible values are a specific month.
#' @return The Slugging average for the year, month, or period put in is calculated.
#' @examples
#' ## default
#' player_SLG(hanhwa_batter_2018,"이용규")
#' ## yearly=2018, monthly=NULL
#' player_SLG(hanhwa_batter_2018,"이용규",yearly=2018)
#' ## yearly=NULL, monthly="05"
#' player_SLG(hanhwa_batter_2018,"이용규",monthly="05")
#' ## yearly=2018, monthly="05"
#' player_SLG(hanhwa_batter_2018,"이용규",yearly=2018,monthly="05")
#' @export

player_SLG <- function(data=kbodatamining::hanhwa_batter_2018,playername,yearly=NULL,monthly=NULL){
  slg <- date_test(data,playername,yearly,monthly,slg_formula)
  return(slg)
}

