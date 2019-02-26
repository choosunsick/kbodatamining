#' Make pitcher data for plotting
#'
#' Function: Make Pitcher's Data for plotting
#'
#' @param data KBO pitcher data
#' @param playername1 The first of the players you want to compare
#' @param playername2 The second of the players you want to compare
#' @param yearly The role of determining the annual period of data
#' @param monthly The role of determining the monthly period of data
#' @return Combined data of two players
#' @examples
#' ## internal function
#' #make_pitcher_data(hanhwa_pitcher_2018,"정우람","이태양")

make_pitcher_data <- function(data,playername1,playername2,yearly=NULL,monthly=NULL){
  player_1 <- kbodatamining::pitcher_boxscore(data,playername1,yearly,monthly)
  player_2 <- kbodatamining::pitcher_boxscore(data,playername2,yearly,monthly)
  return(rbind(player_1,player_2))
}
