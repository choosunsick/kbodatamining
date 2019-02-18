#' year month record show
#'
#' It shows the year-month batter record.
#'
#' @param data Default is hanhwa's batter data, You can include the entire KBO data if you wish.
#' @param playername The name of the batter you want
#' @param recordname The name of the record you want
#' @param year The year you want to find
#' @param month The month you want to find
#' @return show year-month batter record
#' @examples
#' ## internal function
#' #year_monthly_record(hanhwa_batter_2018,"이용규",avg_formula)
year_month_record <- function(data,playername,recordname,year,month){
  player_data <- find_player(data,playername)
  subset_data <- player_data[substr(player_data$date,1,4)==year&substr(player_data$date,6,7)==month,]
  colname <- paste("Date_",year,"_",month,sep="")
  temp <- data.frame(period=colname,record=recordname(subset_data))
  return(temp)
}
