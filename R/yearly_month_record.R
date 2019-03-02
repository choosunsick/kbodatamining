#' Annual record for the entered month
#'
#' It shows the record of the month entered in every year of the entered player
#'
#' @param data KBO datas with at least one year of data
#' @param name The name of the player or the team you want
#' @param recordname The name of the record you want
#' @param month The month you want to find
#' @return the record of the month entered in every year of the entered player
#' @examples
#' ## internal function
#' #yearly_month_record(hanhwa_batter_2018,"이용규",avg_formula,"05")
#' #yearly_month_record(hanhwa_batter_2018,"한화",avg_formula,"05")
yearly_month_record <- function(data,name,recordname,month){
  if(name %in% unique(kbodatamining::hanhwa_batter_2018$team)){
    subset_data <- find_team(data,name)
  }
  else{
    subset_data <- find_player(data,name)
  }
  temp <- data.frame()
  for(i in unique(substr(subset_data$date,1,4))){
    period_data <- subset_data[substr(subset_data$date,1,4)==i&substr(subset_data$date,6,7)==month,]
    colname <- paste("Date_",i,"_",month,sep="")
    temp <- rbind(temp,data.frame(period=colname,record=recordname(period_data)))
  }
  return(temp)
}
