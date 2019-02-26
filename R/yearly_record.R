#' Yearly record show
#'
#' It shows the yearly batter record
#'
#' @param data default is hanhwa's batter data, You can include the entire KBO data if you wish.
#' @param name The name of the batter or the team you want
#' @param recordname The name of the record you want
#' @return calculate yearly batter record
#' @examples
#' ## internal function
#' #yearly_record(hanhwa_batter_2018,"이용규",avg_formula)
yearly_record <- function(data,name,recordname){
  if(name %in% unique(kbodatamining::hanhwa_batter_2018$team) ==TRUE){
    subset_data <- find_team(data,name)
  }
  else{
    subset_data <- find_player(data,name)
  }
  temp <- data.frame()
  for(i in unique(substr(subset_data$date,1,4))){
    yearly_data <- subset_data[substr(subset_data$date,1,4)==i,]
    temp <- rbind(temp,data.frame(period=i,record=recordname(yearly_data)))
  }
  return(temp)
}
