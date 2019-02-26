#' Make plotting data
#'
#' Function: Make Batter's Data for plotting
#'
#' @param data KBO batter data
#' @param playername1 The first of the players you want to compare
#' @param playername2 The second of the players you want to compare
#' @param yearly The role of determining the annual period of data
#' @param monthly The role of determining the monthly period of data
#' @return Combined data of two players
#' @examples
#' ## internal function
#' #make_plot_batter_data(hanhwa_batter_2018,"이용규","정근우")

make_plot_batter_data <- function(data,playername1,playername2,yearly=NULL,monthly=NULL){
  player_1 <- kbodatamining::batter_boxscore(data,playername1,yearly,monthly)
  player_2 <- kbodatamining::batter_boxscore(data,playername2,yearly,monthly)
  return(rbind(player_1,player_2))
}
