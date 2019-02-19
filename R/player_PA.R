#' Calculating batter's Plate appearance
#'
#' This function calculates the Plate appearance for the specified player.
#' This function has an option for yearly and monthly.
#' default: the annual strikeout is calculated
#' If you put a year in the yearly parameter, it calculates the corresponding year Plate appearance.
#' If you put a month in the monthly parameter, it calculates the corresponding yearly-month Plate appearance.
#' If you put a year and a month in two parameters, the Plate appearance for the specific time you put in is calculated.
#' @param data Default data is hanhwa_batter_2018 You can put other kbo batter data if you want.
#' @param playername The name of the batter you want
#' @param yearly The default value is NULL Possible values are a specific year.
#' @param monthly The default value is NULL Possible values are a specific month.
#' @return The Plate appearance for the year, month, or period put in is calculated.
#' @examples
#' ## default
#' player_SO(hanhwa_batter_2018,"이용규")
#' ## yearly=2018, monthly=NULL
#' player_SO(hanhwa_batter_2018,"이용규",yearly=2018)
#' ## yearly=NULL, monthly="05"
#' player_SO(hanhwa_batter_2018,"이용규",monthly="05")
#' ## yearly=2018, monthly="05"
#' player_SO(hanhwa_batter_2018,"이용규",yearly=2018,monthly="05")
#' @export

player_PA <-  function(data=kbodatamining::hanhwa_batter_2018,playername,yearly=NULL,monthly=NULL){
  pa <- date_test(data,playername,yearly,monthly,pa_formula)
  return(pa)
}
