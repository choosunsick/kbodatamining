#'  All batters' data for plotting
#'
#' Function: Make data of all batters from two teams for plotting
#'
#' @param data KBO batter data
#' @param team1 The first of the team you want to compare
#' @param team2 The second of the team you want to compare
#' @param yearly The default value is 2018. The role of determining the annual period of data
#' @param monthly The role of determining the monthly period of data
#' @return Combined data all the batter data from two teams
#' @examples
#' make_all_batter_data(hanhwa_batter_2018,"한화","LG",2018,NULL)
#' @export

make_all_batter_data <- function(data,team1,team2,yearly,monthly){
  temp <- find_team(data,team1)
  temp_1 <- find_team(data,team2)
  id_1 <- unique(temp$id)
  id_2 <- unique(temp_1$id)
  batters_team_data_1 <- do.call(rbind,lapply(1:NROW(id_1),function(x)batter_boxscore(data = temp,name = unique(temp$name[temp$id==id_1[x]]) ,id=id_1[x],yearly,monthly)))
  batters_team_data_2 <- do.call(rbind,lapply(1:NROW(id_2),function(x)batter_boxscore(data = temp_1,name = unique(temp_1$name[temp_1$id==id_2[x]]),id=id_2[x],yearly,monthly)))
  batters_data <- rbind(batters_team_data_1,batters_team_data_2)
  return(batters_data)
}
