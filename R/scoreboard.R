#' Make scoreboard dataframe
#'
#' This function creates a scoreboard for that information based on json data and gameid.
#'
#' @param jsondata You can try the function by importing the file from the json_sample folder. Alternatively, you can create a json-formatted KBO data file by referring to the Readme file.
#' @param gameid KBO game date and versus infomation, You can get this information by importing the name of the json file.
#' @return gameid's baseball game appears as a scoreboard data frame.
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
