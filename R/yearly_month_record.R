#' Monthly record of every year
#'
#' This function shows the Monthly record of every year of the player or team
#'
#' @param data KBO datas with at least one year of data
#' @param name The name of the player or the team you want
#' @param id The id of the player you want
#' @param recordname The name of the record you want
#' @param month Possible value is a specific month
#' @return the Monthly record of every year of the player or team
#' @examples
#' ## internal function - not run
#' #yearly_month_record(hanhwa_batter_2018,"이용규",avg_formula,"05")
#' #yearly_month_record(hanhwa_batter_2018,"한화",avg_formula,"05")
yearly_month_record <- function(data,name,id,recordname,month){
  if(name %in% unique(kbodatamining::hanhwa_batter_2018$team)){
    subset_data <- find_team(data,name)
  }
  else{
    subset_data <- find_player(data,name,id)
  }
  temp <- data.frame()
  for(i in unique(substr(subset_data$date,1,4))){
    period_data <- subset_data[substr(subset_data$date,1,4)==i&substr(subset_data$date,6,7)==month,]
    colname <- paste("Date_",i,"_",month,sep="")
    temp <- rbind(temp,data.frame(period=colname,record=recordname(period_data)))
  }
  return(temp)
}
