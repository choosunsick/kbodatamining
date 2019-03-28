#' The batter box score of the team
#'
#' This function creates annual or periodical box score of the team batting
#' This function has options called 'yearly' or 'monthly'.
#' default: The team's annual box score is created.
#' If you put a year in the yearly parameter, it calculates the box score of corresponding year.
#' If you put a month in the monthly parameter, it calculates the corresponding 'monthly' box score of every year.
#' If you put a year and a month in each parameters, the box score of corresponding month you put in is created.
#' @param data 'Hanhwa_batter_2018' is default data. You can put another kbo batter data if you want.
#' @param teamname The name of team you want
#' @param yearly The default value is NULL. Possible value is a specific year.
#' @param monthly The default value is NULL. Possible value is a specific month. The monthly parameter is a string type.
#' @return The team batting box score of the year or month put in is created.
#' @examples
#' ## Example default: yearly=NULL, monthly=NULL
#' team_batter_boxscore(data=hanhwa_batter_2018,teamname="한화")
#' ## yearly=2018, monthly=NULL
#' team_batter_boxscore(data=hanhwa_batter_2018,teamname="한화",yearly=2018)
#' ## yearly=NULL, monthly="05"
#' team_batter_boxscore(data=hanhwa_batter_2018,teamname="한화",monthly="05")
#' ## yearly=2018, monthly="05"
#' team_batter_boxscore(data=hanhwa_batter_2018,teamname="한화",yearly=2018,monthly="05")
#' @export
team_batter_boxscore <- function(data=kbodatamining::hanhwa_batter_2018,teamname,yearly=NULL,monthly=NULL){
  if(teamname %in% unique(kbodatamining::hanhwa_batter_2018$team) == FALSE){
    warning("Please check the name of the team you are looking for.")
    stop("There is no data with the team name entered.")
  }
  boxscore <- date_test(data,teamname,id=NULL,yearly,monthly,batter_statistics)
  colnames(boxscore)<-c("period","team","g","away","home","pa","ab","h","r","rbi","1B","2B","3B","hr","tb","bb","hbp",
                          "ibb","so","gidp","sh","sf","avg","obp","slg","ops","babip")
  return(boxscore)
}
