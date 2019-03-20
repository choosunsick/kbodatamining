#' Make all pitchers of two team data for plotting
#'
#' Function: Make all pitchers of two team data for plotting
#'
#' @param data KBO pitcher data
#' @param team1 The first of the team you want to compare
#' @param team2 The second of the team you want to compare
#' @param yearly The role of determining the annual period of data
#' @param monthly The role of determining the monthly period of data
#' @return Combined two team datas of all pitchers
#' @examples
#' make_all_pitcher_data(hanhwa_pitcher_2018,"한화","LG",2018,NULL)
#' @export

make_all_pitcher_data <- function(data,team1,team2,yearly=2018,monthly=NULL){
  temp <- find_team(data,team1)
  temp_1 <- find_team(data,team2)
  players_1 <- unique(temp$name)
  players_2 <- unique(temp_1$name)
  pitchers_data_1 <- do.call(rbind,lapply(1:NROW(players_1),function(x)pitcher_boxscore(data = temp,name = players_1[x],id=unique(temp$id[temp$name==players_1[x]]),yearly,monthly)))
  pitchers_data_2 <- do.call(rbind,lapply(1:NROW(players_2),function(x)pitcher_boxscore(data = temp_1,name = players_2[x],id=unique(temp_1$id[temp_1$name==players_2[x]]),yearly,monthly)))
  pitchers_data <- rbind(pitchers_data_1,pitchers_data_2)
  return(pitchers_data)
}
