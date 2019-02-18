#' Yearly record show
#'
#' It shows the yearly batter record
#'
#' @param data default is hanhwa's batter data, You can include the entire KBO data if you wish.
#' @param playername The name of the batter you want
#' @param recordname The name of the record you want
#' @return calculate yearly batter record
#' @examples
#' ## internal function
#' #yearly_record(hanhwa_batter_2018,"이용규",avg_formula)
yearly_record <- function(data,playername,recordname){
  player_data <- find_player(data,playername)
  temp <- data.frame()
  for(i in unique(substr(player_data$date,1,4))){
    yearly_data <- player_data[substr(player_data$date,1,4)==i,]
    temp <- rbind(temp,data.frame(period=i,record=recordname(yearly_data)))
  }
  return(temp)
}
