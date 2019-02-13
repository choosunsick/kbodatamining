#' json file to dataframe
#'
#' A function that creates a json file as a data frame.
#'
#' @param jsondata KBO data json file
#' @param gameid KBO game date and versus infomation
#' @return One game is made up of data frames.
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
