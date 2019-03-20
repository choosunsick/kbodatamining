#' Extracting player data
#'
#' find_player function creates data that contains player you want.
#'
#' @param data KBO data with playername
#' @param playername The playername you want to find
#' @param id player id you want to find
#' @return The batter data only the player you want to find
#' @examples
#' find_player(hanhwa_batter_2018,"이용규",NULL)
#' @export
find_player <- function(data,playername,id){
  print(id)
  if(is.null(id)==TRUE){
    player_data <- data[data$name == playername,]
    }
  else{
    player_data <- data[data$name == playername&data$id==id,]
    print(unique(player_data$id))
    if(NROW(unique(player_data$id))!=1){
      warning("This person is presumed to have the same name.")
      stop("Please check all_player_id_list.csv for the player's id you want.")
  }
}
  if(NROW(player_data)==0){
    warning("Please check the name of the player you are looking for.")
    stop("There is no data for player.")
  }
  return(player_data)
}
