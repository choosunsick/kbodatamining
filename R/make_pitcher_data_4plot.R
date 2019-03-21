#' Combine two pitcher boxscores
#'
#' Function: Creates data that combines two pitchers.
#'
#' @param data KBO pitcher data
#' @param playername1 The first of the players you want to compare
#' @param playername2 The second of the players you want to compare
#' @param yearly The role of determining the annual period of data
#' @param monthly The role of determining the monthly period of data
#' @return Box score data combined with two players' box scores
#' @examples
#' make_pitcher_data_4plot(hanhwa_pitcher_2018,"정우람","이태양")
#' @export

make_pitcher_data_4plot <- function(data,playername1,playername2,yearly=NULL,monthly=NULL){
  player_1 <- kbodatamining::pitcher_boxscore(data = data,name = playername1,yearly = yearly,monthly = monthly)
  player_2 <- kbodatamining::pitcher_boxscore(data = data,name = playername2,yearly = yearly,monthly = monthly)
  return(rbind(player_1,player_2))
}
