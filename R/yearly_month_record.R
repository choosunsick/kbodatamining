#' yearly month record show
#'
#' It shows the yearly-month batter record.
#'
#' @param data default is hanhwa's batter data, You can include the entire KBO data if you wish.
#' @param name The name of the batter or the team you want
#' @param recordname The name of the record you want
#' @param month The month you want to find
#' @return show yearly-month batter record
#' @examples
#' ## internal function
#' #yearly_month_record(hanhwa_batter_2018,"이용규",avg_formula)
yearly_month_record <- function(data,name,recordname,month){
  if(name %in% unique(kbodatamining::hanhwa_batter_2018$team) ==TRUE ){
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
