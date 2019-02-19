#' Count yearly-monthly pitcher's winning percentage
#'
#' This function calculates the WPCT for the specified player.
#' This function has an option for yearly and monthly.
#' default: the annualy WPCT is calculated
#' If you put a year in the yearly parameter, it calculates the corresponding year WPCT.
#' If you put a month in the monthly parameter, it calculates the corresponding yearly-month WPCT.
#' If you put a year and a month in two parameters, the HA for the specific time you put in is calculated.
#' @param data Default data is hanhwa_pitcher_2018, You can put other KBO pitcher data if you want.
#' @param playername The name of the KBO pitcher you want.
#' @param yearly The default value is NULL Possible values are a specific year.
#' @param monthly The default value is NULL Possible values are a specific month.
#' @return The WPCT for the year, month, or period put in is calculated.
#' @examples
#' ## default
#' player_WPCT(hanhwa_pitcher_2018,"송은범")
#' ## yearly=2018, monthly=NULL
#' player_WPCT(hanhwa_pitcher_2018,"송은범",yearly=2018)
#' ## yearly=NULL, monthly="05"
#' player_WPCT(hanhwa_pitcher_2018,"송은범",monthly="05")
#' ## yearly=2018, monthly="05"
#' player_WPCT(hanhwa_pitcher_2018,"송은범",yearly=2018,monthly="05")
#' @export
player_WPCT <- function(data=kbodatamining::hanhwa_pitcher_2018,playername,yearly=NULL,monthly=NULL){
  wpct <- date_test(data,playername,yearly,monthly,wpct_formula)
  return(wpct)
}
