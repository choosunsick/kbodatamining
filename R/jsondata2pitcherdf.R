#' json file to pitcher dataframe
#'
#' A function that creates a json file as a pitcher data frame.
#'
#' @param jsondata KBO data json file
#' @param gameid KBO game date and versus infomation
#' @return A game consists of a pitcher data frame.
#' @examples
#' ## You can read the json file in the json_sample folder and use it.
#' ## You can use the fromJSON function of the jsonlite package to read the json file.
#' ## You can also get the KBO full game json file.
#' ## You can import it from the "https://github.com/LOPES-HUFS/KBO_Data_Wrangling" project.
#' ## And working the code in the notebook file.
#' ## If you get a json file through one of the above methods,
#' ## you can open it and use it as an argument to the function.
#' ## The gameid argument can be obtained using the default function names.
#' ## jsondata <- jsonlite::fromJSON(./json_sample/Hanhwa_normalseason_2018.json)
#' # json2pitcherdf(jsondata,names(jsondata)[1])
#' @export
json2pitcherdf <- function(jsondata,gameid){
  merge_team <- rbind.data.frame(jsondata[[gameid]]$away_pitcher,jsondata[[gameid]]$home_pitcher)
  merge_team$inning <- as.numeric(merge_team$inning)
  merge_team$restinning <- as.numeric(merge_team$restinning)
  return(merge_team)
}
