#' yearly month record show
#'
#' It shows the yearly-month batter record.
#'
#' @param data default is hanhwa's batter data, You can include the entire KBO data if you wish.
#' @param playername The name of the batter you want
#' @param recordname The name of the record you want
#' @param month The month you want to find
#' @return show yearly-month batter record
#' @examples
#' ## internal function
#' #yearly_month_record(hanhwa_batter_2018,"이용규",avg_formula)
yearly_month_record <- function(data,playername,recordname,month){
  player_data <- find_player(data,playername)
  temp <- data.frame()
  for(i in unique(substr(player_data$date,1,4))){
    subset_data <- player_data[substr(player_data$date,1,4)==i&substr(player_data$date,6,7)==month,]
    colname <- paste("Date_",i,"_",month,sep="")
    temp <- rbind(temp,data.frame(period=colname,record=recordname(subset_data)))
  }
  return(temp)
}
