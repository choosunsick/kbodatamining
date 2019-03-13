#' The box score of the batter
#'
#' This function creates a box score for the batter for the year or period.
#' This function has an option for yearly and monthly.
#' default: The player's annual box score is created.
#' If you put a year in the yearly parameter, it calculates the corresponding year box score.
#' If you put a month in the monthly parameter, it calculates the corresponding yearly-month box score.
#' If you put a year and a month in two parameters, the box score for the specific time you put in is created.
#' @param data Default data is hanhwa_batter_2018 You can put other kbo batter data if you want.
#' @param name The name of the batter you want
#' @param yearly The default value is NULL Possible values are a specific year.
#' @param monthly The default value is NULL Possible values are a specific month.
#' @return The box score for the year, month, or period put in is created.
#' @examples
#' ## default: yearly=NULL,monthly=NULL
#' batter_boxscore(hanhwa_batter_2018,"이용규")
#' ## yearly=2018, monthly=NULL
#' batter_boxscore(hanhwa_batter_2018,"이용규",yearly=2018)
#' ## yearly=NULL, monthly="05"
#' batter_boxscore(hanhwa_batter_2018,"이용규",monthly="05")
#' ## yearly=2018, monthly="05"
#' batter_boxscore(hanhwa_batter_2018,"이용규",yearly=2018,monthly="05")
#' @export
batter_boxscore <- function(data=kbodatamining::hanhwa_batter_2018,name,yearly=NULL,monthly=NULL){
  boxscore <- date_test(data,name,yearly,monthly,batter_statistics)
  if(name_test(name)=="team"){
    colnames(boxscore)<-c("period","team","g","away","home","pa","ab","h","r","rbi","1B","2B","3B","hr","tb","bb","hbp",
                          "ibb","so","gidp","sh","sf","avg","obp","slg","ops","babip")
  }
  else{
    boxscore <- cbind(name,boxscore)
    colnames(boxscore)<-c("name","period","team","g","away","home","pa","ab","h","r","rbi","1B","2B","3B","hr","tb","bb","hbp",
                          "ibb","so","gidp","sh","sf","avg","obp","slg","ops","babip")
  }
  return(boxscore)
}
