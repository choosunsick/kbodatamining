#' Yearly record
#'
#' This function shows the yearly record of the player or team
#'
#' @param data KBO datas with at least one year of data
#' @param name The name of the player or the team you want
#' @param id The id of the player you want
#' @param recordname The name of the record you want
#' @return The yearly record of the player or team
#' @examples
#' ## internal function - not run
#' #yearly_record(hanhwa_batter_2018,"이용규",avg_formula)
#' #yearly_record(hanhwa_batter_2018,"한화",avg_formula)
yearly_record <- function(data,name,id,recordname){
  if(name %in% unique(kbodatamining::hanhwa_batter_2018$team)){
    subset_data <- find_team(data,name)
  }
  else{
    subset_data <- find_player(data,name,id)
  }
  temp <- data.frame()
  for(i in unique(substr(subset_data$date,1,4))){
    yearly_data <- subset_data[substr(subset_data$date,1,4)==i,]
    temp <- rbind(temp,data.frame(period=i,record=recordname(yearly_data)))
  }
  return(temp)
}
