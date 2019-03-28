#' The pitcher box score of the team
#'
#' This function creates annual or periodical box score of the team pitching
#' This function has options called 'yearly' or 'monthly'.
#' default: The team's annual box score is created.
#' If you put a year in the yearly parameter, it calculates the box score of corresponding year.
#' If you put a month in the monthly parameter, it calculates the corresponding 'monthly' box score of every year.
#' If you put a year and a month in each parameters, the box score of corresponding month you put in is created.
#' @param data 'Hanhwa_pitcher_2018' is default data. You can put another kbo pitcher data if you want.
#' @param teamname The name of team you want
#' @param yearly The default value is NULL. Possible value is a specific year.
#' @param monthly The default value is NULL. Possible value is a specific month. The monthly parameter is a string type.
#' @return The team pitching box score of the year or month put in is created.
#' @examples
#' ## Example default: yearly=NULL, monthly=NULL
#' team_pitcher_boxscore(data=hanhwa_pitcher_2018,teamname="한화")
#' ## yearly=2018, monthly=NULL
#' team_pitcher_boxscore(data=hanhwa_pitcher_2018,teamname="한화",yearly=2018)
#' ## yearly=NULL, monthly="05"
#' team_pitcher_boxscore(data=hanhwa_pitcher_2018,teamname="한화",monthly="05")
#' ## yearly=2018, monthly="05"
#' team_pitcher_boxscore(data=hanhwa_pitcher_2018,teamname="한화",yearly=2018,monthly="05")
#' @export
team_pitcher_boxscore <- function(data=kbodatamining::hanhwa_pitcher_2018,teamname,yearly=NULL,monthly=NULL){
  boxscore <- date_test(data,teamname,id=NULL,yearly,monthly,pitcher_statistics)
  cg_list <- team_disposal(cg_calculate(data,teamname),boxscore,teamname)
  cgs_list <- team_disposal(cgs_calculate(data,teamname),boxscore,teamname)
  if(NROW(cg_list)!=1 &NROW(cgs_list)!=1){
    boxscore <- cbind(boxscore,cg_list$Freq[match(boxscore$period,cg_list$Var1)],cgs_list$Freq[match(boxscore$period,cgs_list$Var1)])
  }
  else if(NROW(cg_list)!=1 &NROW(cgs_list)==1){
    boxscore <- cbind(boxscore,cg_list$Freq[match(boxscore$period,cg_list$Var1)],cgs_list)
  }
  else{
    boxscore <- cbind(boxscore,cg_list$Freq,cgs_list$Freq)
  }
  colnames(boxscore)<-c("period","team","g","away","home","win","lose","draw","wpct","sv","hld","ip","r","er","k","bb&hbp","pit",
                        "tbf","ha","hra","era","p_ip","k_9","hr_9","oba","cg","cgs")
  boxscore[is.na(boxscore)==TRUE]<-0
  return(boxscore)
}
