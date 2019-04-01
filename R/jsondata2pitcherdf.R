#' json file to pitcher dataframe
#'
#' This function changes pitcher data in json file to dataframe data
#'
#' ## You can read the json file in the json_sample folder and use it.
#' ## You can use the fromJSON function of the jsonlite package to read the json file.
#' ## You can also get the KBO full game json file.
#' ## You can extract it from the "https://github.com/LOPES-HUFS/KBO_Data_Wrangling" project
#' ## And working the code in the notebook file.
#' ## If you get a json file through one of the above methods,
#' ## you can open it and use it as an paremeter to the function.
#' ## The gameid paremeter can be obtained using the default function names.
#'
#' @param jsondata KBO data json file
#' @param gameid KBO game date and versus infomation
#' @return the pitcher dataframe data that is changed from json data file
#' @examples
#' ## not run
#' ## This example does not run the example because it requires a json file.
#' # jsondata <- jsonlite::fromJSON(./json_sample/Hanhwa_normalseason_2018.json)
#' # json2pitcherdf(jsondata,names(jsondata)[1])
#' @export
json2pitcherdf <- function(jsondata,gameid){
  merge_team <- rbind.data.frame(jsondata[[gameid]]$away_pitcher,jsondata[[gameid]]$home_pitcher)
  merge_team$inning <- as.numeric(merge_team$inning)
  merge_team$restinning <- as.numeric(merge_team$restinning)
  return(merge_team)
}
