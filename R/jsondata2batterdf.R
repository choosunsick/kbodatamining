#' json file to batter dataframe
#'
#' This function changes batter data in json file to dataframe data
#'
#' @param jsondata KBO data json file
#' @param gameid KBO game date and versus infomation
#' @return the dataframe data that is changed from batter data
#' @examples
#' ## You can read the json file in the json_sample folder and use it.
#' ## You can use fromJSON function of jsonlite package to read the json file.
#' ## You can also get KBO full game json file.
#' ## You can extract it from the "https://github.com/LOPES-HUFS/KBO_Data_Wrangling" project
#' ## And work the code in the notebook file.
#' ## If you got a json file through one of the above methods,
#' ## you can open it and use it as an argument of the function.
#' ## The gameid argument can be obtained through using the default function names.
#' ## jsondata <- jsonlite::fromJSON(./json_sample/Hanhwa_normalseason_2018.json)
#' # json2batterdf(jsondata,names(jsondata)[1])
#' @export
json2batterdf <- function(jsondata,gameid){
  merge_team <- rbind.data.frame(jsondata[[gameid]]$away_batter,jsondata[[gameid]]$home_batter)
  if (NCOL(merge_team)==23){
    merge_team$`12` <- 0
  }
  else if (NCOL(merge_team)==22){
    merge_team$`12` <- 0
    merge_team$`11` <- 0
  }
  else if (NCOL(merge_team)==21){
    merge_team$`12` <- 0
    merge_team$`11` <- 0
    merge_team$`10` <- 0
  }
  else if (NCOL(merge_team)==20){
    merge_team$`12` <- 0
    merge_team$`11` <- 0
    merge_team$`10` <- 0
    merge_team$`9` <- 0
  }
  else if (NCOL(merge_team)==19){
    merge_team$`12` <- 0
    merge_team$`11` <- 0
    merge_team$`10` <- 0
    merge_team$`9` <- 0
    merge_team$`8` <- 0
  }
  else if (NCOL(merge_team)==18){
    merge_team$`12` <- 0
    merge_team$`11` <- 0
    merge_team$`10` <- 0
    merge_team$`9` <- 0
    merge_team$`8` <- 0
    merge_team$`7` <- 0
  }
  else if (NCOL(merge_team)==17){
    merge_team$`12` <- 0
    merge_team$`11` <- 0
    merge_team$`10` <- 0
    merge_team$`9` <- 0
    merge_team$`8` <- 0
    merge_team$`7` <- 0
    merge_team$`6` <- 0
  }
  else{
    print("pass")
  }
  return(merge_team)
}
