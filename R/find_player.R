#' Extracting player data
#'
#' find_player function creates data that contains player you want.
#'
#' @param data KBO data with playername
#' @param playername The playername you want to find
#' @param id player id you want to find
#' @return The batter data only the player you want to find
#' @examples
#' ## internal function
#' find_player(hanhwa_batter_2018,"이용규",NULL)
#' @export
find_player <- function(data,playername,id){
  if(is.null(id)==TRUE){
    if(name_test(playername)=="samename"){
      warning("This person is presumed to have the samename.")
      stop("Please use find_player_id function.")
    }
    player_data <- data[data$name == playername,]
    }
  else{
    player_data <- data[data$name == playername&data$id==id,]
  }
  if(NROW(player_data)==0){
    warning("Please check the name of the player you are looking for.")
    stop("There is no data for that player.")
  }
  return(player_data)
}
