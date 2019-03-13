#' get player id
#'
#' This function creates a player id for the players in the data.
#'
#' @param data KBO data
#' @param idlist The ID list contains the batter and pitcher ID list files in the player_id_list folder.
#' @return Data with player id
#' @examples
#' batter_id  <- read.csv(./player_id_list/batter_id_full.csv)
#' id_2018<- batter_id[substr(batter_id$date,1,4)==2018,]
#' id_hanhwa_2018<- id_2018[id_2018$away=="한화"|id_2018$home=="한화",]
#' get_player_id(hanhwa_batter_2018,"id_hanhwa_2018")
#' @export

get_player_id <- function(data,idlist){
  data$id <- ""
  data <- data[order(data$name,decreasing = F),]
  data$id[which(data$away==idlist$away)] <- idlist$id[which(data$away==idlist$away)]
  data$id[data$id==""][order(data$away[data$id==""],decreasing = F)] <-
    idlist$id[which(data$away!=idlist$away)][order(idlist$away[which(data$away!=idlist$away)],decreasing = F)]
  return(data)
}
