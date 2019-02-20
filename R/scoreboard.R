#' Make scoreboarddataframe
#'
#' It shows the scoreboard of the KBO game.
#'
#' @param jsondata KBO data json file
#' @param gameid KBO game date and versus infomation
#' @return the baseball match of gameid appears in scoreboard dataframe.
#' @examples
#' ## not run
#' ## You can read the json file in the json_sample folder and use it.
#' ## You can use the fromJSON function of the jsonlite package to read the json file.
#' ## You can also get the KBO full game json file.
#' ## You can import it from the "https://github.com/LOPES-HUFS/KBO_Data_Wrangling" project.
#' ## jsondata <- jsonlite::fromJSON(./json_sample/Hanhwa_normalseason_2018.json)
#' # make_scoreboard(jsondata,names(jsondata)[1])
#' @export
make_scoreboard <- function(jsondata,gameid){
  date <- paste(substr(gameid,1,4),"-",substr(gameid,5,6),"-",substr(gameid,7,8),sep = "")
  scoreboard <- data.frame(경기날짜=date,구장=jsondata[[gameid]]$ETC_info$구장,관중=jsondata[[gameid]]$ETC_info$관중,
                 경기시간=jsondata[[gameid]]$ETC_info$경기시간,jsondata[[gameid]]$scoreboard)
  return(scoreboard)
}
