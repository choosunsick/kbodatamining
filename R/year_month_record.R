#' year month record show
#'
#' It shows the year-month batter record.
#'
#' @param data Default is hanhwa's batter data, You can include the entire KBO data if you wish.
#' @param name The name of the batter or the team you want
#' @param recordname The name of the record you want
#' @param year The year you want to find
#' @param month The month you want to find
#' @return show year-month batter record
#' @examples
#' ## internal function
#' #year_monthly_record(hanhwa_batter_2018,"이용규",avg_formula)
year_month_record <- function(data,name,recordname,year,month){
  if(name %in% unique(kbodatamining::hanhwa_batter_2018$team) ==TRUE){
    temp_data <- find_team(data,name)
  }
  else{
    temp_data <- find_player(data,name)
  }
  subset_data <- temp_data[substr(temp_data$date,1,4)==year&substr(temp_data$date,6,7)==month,]
  colname <- paste("Date_",year,"_",month,sep="")
  temp <- data.frame(period=colname,record=recordname(subset_data))
  return(temp)
}
