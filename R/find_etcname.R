#' Find etc name
#'
#' finding etc name from jsondata
#'
#' @param jsondata KBO data json file
#' @param gameid KBO game date and versus infomation
#' @param name1 find item1
#' @param name2 find item2
#' @param name3 find item3
#' @return find items etc info
#' @examples
#' ## internal function - not run
#' # jsondata <- jsonlite::fromJSON("./json_sample/Hanhwa_normalseason_2018.json")
#' # find_etcname(jsondata,names(jsondata)[1],"구장","관중","경기시간")

find_etcname <- function(jsondata,gameid,name1,name2,name3){
  stadium <- jsondata[[gameid]]$ETC_info[[name1]]
  spactator <- jsondata[[gameid]]$ETC_info[[name2]]
  time <- jsondata[[gameid]]$ETC_info[[name3]]
  return(data.frame(stadium,spactator,time))
}
