#' Make scoreboard dataframe
#'
#' It shows the scoreboard of the KBO game.
#'
#' @param jsondata KBO data json file
#' @param gameid KBO game date and versus infomation
#' @return the baseball match of gameid appears in scoreboard dataframe.
#' @examples
#' ## not run
#' # jsondata <- jsonlite::fromJSON("./json_sample/Hanhwa_normalseason_2018.json")
#' # scoreboard(jsondata,names(jsondata)[1])
#' @export
scoreboard <- function(jsondata,gameid){
  date <- paste(substr(gameid,1,4),"_",substr(gameid,5,6),"_",substr(gameid,7,8),sep = "")
  stadium <- names(jsondata[[gameid]]$ETC_info)[NROW(names(jsondata[[gameid]]$ETC_info))-4]
  spactator <- names(jsondata[[gameid]]$ETC_info)[NROW(names(jsondata[[gameid]]$ETC_info))-3]
  playtime <- names(jsondata[[gameid]]$ETC_info)[NROW(names(jsondata[[gameid]]$ETC_info))]
  etc <- find_etcname(jsondata,gameid,stadium,spactator,playtime)
  score <- jsondata[[gameid]]$scoreboard
  score_board <- cbind(date,etc,score)
  return(score_board)
}
