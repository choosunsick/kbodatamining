#' Combine two batter boxscores
#'
#' Function: Creates data that combines two batters.
#'
#' @param data KBO batter data
#' @param playername1 The first of the players you want to compare
#' @param playername2 The second of the players you want to compare
#' @param yearly The role of determining the annual period of data
#' @param monthly The role of determining the monthly period of data
#' @return Box score data combined with two players' box scores
#' @examples
#' make_batter_data_4plot(hanhwa_batter_2018,"이용규","정근우")
#' @export

make_batter_data_4plot <- function(data,playername1,playername2,yearly=NULL,monthly=NULL){
  player_1 <- kbodatamining::batter_boxscore(data = data,name = playername1,yearly = yearly,monthly = monthly)
  player_2 <- kbodatamining::batter_boxscore(data = data,name = playername2,yearly = yearly,monthly = monthly)
  return(rbind(player_1,player_2))
}
