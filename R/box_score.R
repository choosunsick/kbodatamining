#' Make box score dataframe
#'
#' It shows the box score of the KBO game.
#'
#' @param jsondata KBO data json file
#' @param gameid KBO game date and versus infomation
#' @return gameid Shows the box score of the match that matches the information.
#' @examples
#' ## not run
#' ## You can read the json file in the json_sample folder and use it.
#' ## You can use the fromJSON function of the jsonlite package to read the json file.
#' ## You can also get the KBO full game json file.
#' ## You can import it from the "https://github.com/LOPES-HUFS/KBO_Data_Wrangling" project.
#' ## jsondata <- jsonlite::fromJSON(./json_sample/Hanhwa_normalseason_2018.json)
#' # box_score(jsondata,names(jsondata)[1])
#' @export
box_score <- function(jsondata,gameid){
  return(jsondata[[gameid]]$scoreboard)
}
