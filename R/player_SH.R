#' Calculating batter's Sacrifice hit
#'
#' This function calculates the Sacrifice hit for the specified player.
#' This function has an option for yearly and monthly.
#' default: the annualy Sacrifice hit is calculated
#' If you put a year in the yearly parameter, it calculates the corresponding year Sacrifice hit.
#' If you put a month in the monthly parameter, it calculates the corresponding yearly-month Sacrifice hit.
#' If you put a year and a month in two parameters, the Sacrifice hit for the specific time you put in is calculated.
#' @param data Default data is hanhwa_batter_2018 You can put other kbo batter data if you want.
#' @param playername The name of the batter you want.
#' @param yearly The default value is NULL Possible values are a specific year.
#' @param monthly The default value is NULL Possible values are a specific month.
#' @return The Sacrifice hit for the year, month, or period put in is calculated.
#' @examples
#' ## default
#' player_SH(hanhwa_batter_2018,"이용규")
#' ## yearly=2018, monthly=NULL
#' player_SH(hanhwa_batter_2018,"이용규",yearly=2018)
#' ## yearly=NULL, monthly="05"
#' player_SH(hanhwa_batter_2018,"이용규",monthly="05")
#' ## yearly=2018, monthly="05"
#' player_SH(hanhwa_batter_2018,"이용규",yearly=2018,monthly="05")
#' @export

player_SH <- function(data=kbodatamining::hanhwa_batter_2018,playername,yearly=NULL,monthly=NULL){
  sacrifice_hit <- date_test(data,playername,yearly,monthly,sh_formula)
  return(sacrifice_hit)
}

