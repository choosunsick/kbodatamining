#' The box score of the batter
#'
#' This function creates annual or periodical box score of the batter.
#' This function has options called 'yearly' or 'monthly'.
#' default: The player's annual box score is created.
#' If you put a year in the yearly parameter, it calculates the box score of corresponding year.
#' If you put a month in the monthly parameter, it calculates the corresponding monthly box score of every year.
#' If you put a year and a month in each parameters, the box score of corresponding month you put in is created.
#' If you are looking for a player who has the same name with other players, you need to find the player's ID and put it in the 'ID' parameter.
#' @param data 'Hanhwa_batter_2018' is default data. You can put another kbo batter data if you want.
#' @param name The name of the batter you want
#' @param id This is not a required parameter. The ID parameter is a numeric type.
#' @param yearly The default value is NULL. Possible value is a specific year.
#' @param monthly The default value is NULL. Possible value is a specific month.
#' @return The batter box score of the year or month put in is created.
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
batter_boxscore <- function(data=kbodatamining::hanhwa_batter_2018,name,id=NULL,yearly=NULL,monthly=NULL){
  boxscore <- date_test(data,name,id,yearly,monthly,batter_statistics)
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
