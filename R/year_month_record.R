#' Record of players by period
#'
#' It shows the record you want to view the player you entered during the entered period.
#'
#' @param data KBO datas with at least one year of data
#' @param name The name of the player or the team you want
#' @param recordname The name of the record you want
#' @param year The year you want to find
#' @param month The month you want to find
#' @return The record of the player during entered period
#' @examples
#' ## internal function
#' # year_month_record(hanhwa_batter_2018,"이용규",avg_formula,2018,"05")
#' # year_month_record(hanhwa_batter_2018,"한화",avg_formula,2018,"05")
year_month_record <- function(data,name,recordname,year,month){
  if(name_test(name)=="team"){
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
