#' Extracting player data
#'
#' find_player function creates data that contains player you want.
#'
#' @param data KBO data with playername
#' @param playername The playername you want to find
#' @return The batter data only the player you want to find
#' @examples
#' find_player(hanhwa_batter_2018,"이용규")
#' @export
find_player <- function(data,playername){
  player_data <- data[data$name == playername,]
  if(NROW(player_data)==0){
    warning("There is no data for player.")
  }
  return(player_data)
}
