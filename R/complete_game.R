#' Complete game count
#'
#' Creating a list of players who have achieve Complete game on the team.
#'
#' @param data KBO pitcher data
#' @param team KBO team name
#' @return List of players who achieved Complete game
#' @examples
#' cg_calculate(hanhwa_pitcher_2018,"한화")
#' @export

cg_calculate <- function(data,team){
  data <- find_team(data,team)
  cg_list <- data.frame()
  for(i in unique(data$date)){
    if(NROW(data[data$date==i,])==1){
      cg_list <- rbind(cg_list,data.frame(year=substr(data$date[data$date==i],1,4),team=team,name=data$name[data$date==i],cg=1))
    }
  }
  return(cg_list)
}
