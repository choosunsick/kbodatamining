#' Extracting team data
#'
#' finding data that contains team you want.
#'
#' @param data KBO data with playername
#' @param team The team you want to find
#' @return The team data that you want to find
#' @importFrom stringr str_split str_detect
#' @examples
#' find_team(hanhwa_batter_2018,"한화")
#' @export
find_team <- function(data,team){
  if(str_detect(string = team,",")){
    team_list <- str_split(string = team,",",simplify = T)
    team_data <- do.call(rbind,lapply(team_list,function(x)data[data$team == x,]))
  }
  else{
    team_data <- data[data$team == team,]
  }
  if(NROW(team_data)==0){
    stop("There is no data for team.")
  }
  return(team_data)
}
