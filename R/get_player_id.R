#' Get player id
#'
#' Matching player data and player id appropriately
#' @param data  KBO batter data or KBO pitcher data.
#' @param idlist appropriate id list for your data
#' @return Player data with player id
#' @examples
#' ## not run
#' ## please check README
#' #batter_id  <- read.csv("./player_id_list/batter_id_list.csv",stringsAsFactors = F)
#' #batter_id_2018 <- batter_id[substr(batter_id$date,1,4)==2018,]
#' #batter_id_hanhwa_2018 <- batter_id_2018[batter_id_2018$away=="한화"|batter_id_2018$home=="한화",]
#' #hanhwa_batter_2018 <- get_player_id(hanhwa_batter_2018,batter_id_hanhwa_2018)
#' @export

get_player_id<- function(data,idlist){
  data$id <- ""
  data <- data[order(data$name,decreasing = F),]
  data$id[which(data$away==idlist$away)] <- idlist$id[which(data$away==idlist$away)]
  data$id[data$id==""][order(data$away[data$id==""],decreasing = F)] <-
    idlist$id[which(data$away!=idlist$away)][order(idlist$away[which(data$away!=idlist$away)],decreasing = F)]
  return(data)
}
