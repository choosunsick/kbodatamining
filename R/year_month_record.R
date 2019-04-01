#' Record of player or team by period
#'
#' This function shows the baseball record of the player or team of the year and month you put in
#'
#' @param data KBO datas with at least one year of data
#' @param name The name of the player or the team you want
#' @param id The id of the player you want
#' @param recordname The name of the record you want
#' @param year Possible value is a specific year.
#' @param month Possible value is a specific month.
#' @return The record of the player or team during the period you put
#' @examples
#' ## internal function - not run
#' # year_month_record(hanhwa_batter_2018,"이용규",avg_formula,2018,"05")
#' # year_month_record(hanhwa_batter_2018,"한화",avg_formula,2018,"05")
year_month_record <- function(data,name,id,recordname,year,month){
  if(name %in% unique(kbodatamining::hanhwa_batter_2018$team)){
    temp_data <- find_team(data,name)
  }
  else{
    temp_data <- find_player(data,name,id)
  }
  subset_data <- temp_data[substr(temp_data$date,1,4)==year&substr(temp_data$date,6,7)==month,]
  colname <- paste("Date_",year,"_",month,sep="")
  temp <- data.frame(period=colname,record=recordname(subset_data))
  return(temp)
}
