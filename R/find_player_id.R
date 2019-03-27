#' Extracting player id
#'
#' This function finds the id of the player you want.
#'
#' @param playername The playername you want to find
#' @importFrom utils read.csv
#' @return the player id that you want to find
#' @examples
#' find_player_id("이용규")
#' @export
find_player_id <- function(playername){
  id <- kbodatamining::all_player_idlist[kbodatamining::all_player_idlist$name==playername,]
  return(id)
}
