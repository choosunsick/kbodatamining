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
#' # make_scoreboard(jsondata,names(jsondata)[1])
#' @export
make_scoreboard <- function(jsondata,gameid){
  date <- paste(substr(gameid,1,4),"_",substr(gameid,5,6),"_",substr(gameid,7,8),sep = "")
  temp <-data.frame(jsondata[[gameid]]$ETC_info)
  scoreboard <- data.frame(Date=date,stadium=unique(temp[,11]),spectator=unique(temp[,12]),
                           time=unique(temp[,15]),jsondata[[gameid]]$scoreboard)
  return(scoreboard)
}
