#' Complete Game Shutout count
#'
#' Creating a list of players who have achieve Complete Game Shutout on the team.
#'
#' @param data KBO pitcher data
#' @param team KBO team name
#' @return List of players who achieved Complete Game Shutout
#' @examples
#' cgs_calculate(hanhwa_pitcher_2018,"한화")
#' @export

cgs_calculate <- function(data,team){
  data <- find_team(data,team)
  cgs_list <- data.frame()
  for(i in unique(data$date)){
    if(all(NROW(data[data$date==i,])==1 & data$r[data$date==i]==0)==TRUE){
      cgs_list <- rbind(cgs_list,data.frame(year=substr(data$date[data$date==i],1,4),team=team,name=data$name[data$date==i],cgs=1))
    }
  }
  return(cgs_list)
}
