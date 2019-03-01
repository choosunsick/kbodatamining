#' Combines data from two batter boxscore
#'
#' Function: Create data that combines data from two players
#'
#' @param data KBO batter data
#' @param playername1 The first of the players you want to compare
#' @param playername2 The second of the players you want to compare
#' @param yearly Determines the yearly period of the data.
#' @param monthly Determines the monthly period of the data.
#' @return Combined data of two player boxscore
#' @examples
#' ## internal function
#' #make_batter_data(hanhwa_batter_2018,"이용규","정근우")

make_batter_data <- function(data,playername1,playername2,yearly=NULL,monthly=NULL){
  player_1 <- kbodatamining::batter_boxscore(data,playername1,yearly,monthly)
  player_2 <- kbodatamining::batter_boxscore(data,playername2,yearly,monthly)
  return(rbind(player_1,player_2))
}
