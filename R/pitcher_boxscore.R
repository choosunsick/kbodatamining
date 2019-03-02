#' The box score of the pitcher player
#'
#' This function creates a box score for the pitcher for the year or period.
#' This function has an option for yearly and monthly.
#' default: The player's annual box score is created.
#' If you put a year in the yearly parameter, it calculates the corresponding year box score.
#' If you put a month in the monthly parameter, it calculates the corresponding yearly-month box score.
#' If you put a year and a month in two parameters, the box score for the specific time you put in is created.
#' @param data Default data is hanhwa_pitcher_2018 You can put other KBO pitcher data if you want.
#' @param name The name of the pitcher you want
#' @param yearly The default value is NULL Possible values are a specific year.
#' @param monthly The default value is NULL Possible values are a specific month.
#' @return The box score for the year, month, or period put in is created.
#' @examples
#' ## default: yearly=NULL,monthly=NULL
#' pitcher_boxscore(hanhwa_pitcher_2018,"정우람")
#' ## yearly=2018, monthly=NULL
#' pitcher_boxscore(hanhwa_pitcher_2018,"정우람",yearly=2018)
#' ## yearly=NULL, monthly="05"
#' pitcher_boxscore(hanhwa_pitcher_2018,"정우람",monthly="05")
#' ## yearly=2018, monthly="05"
#' pitcher_boxscore(hanhwa_pitcher_2018,"정우람",yearly=2018,monthly="05")
#' @export

pitcher_boxscore <- function(data=kbodatamining::hanhwa_pitcher_2018,name,yearly=NULL,monthly=NULL){
  boxscore <- date_test(data,name,yearly,monthly,pitcher_statistics)
  cg_list <- cg_calculate(data,boxscore$record.team)
  cgs_list <- cgs_calculate(data,boxscore$record.team)
  if(name %in% unique(kbodatamining::hanhwa_pitcher_2018$team)){
    cg <- sum(cg_list$cg)
    cgs <- sum(cgs_list$cgs)
    boxscore <- cbind(boxscore,cg,cgs)
    colnames(boxscore)<-c("period","team","g","away","home","win","lose","draw","wpct","sv","hld","ip","r","er","k","bb&hbp","pit",
                          "tbf","ha","hra","era","p_ip","k_9","hr_9","oba","cg","cgs")
  }
  else{
    cg <- ifelse(any(unique(cg_list$name))==name,cg_list$cg[cg_list$name==name],0)
    cgs <- ifelse(any(unique(cgs_list$name))==name,cgs_list$cgs[cgs_list$name==name],0)
    boxscore <- cbind(name,boxscore,cg,cgs)
    colnames(boxscore)<-c("name","period","team","g","away","home","win","lose","draw","wpct","sv","hld","ip","r","er","k","bb&hbp","pit",
                          "tbf","ha","hra","era","p_ip","k_9","hr_9","oba","cg","cgs")

  }
  return(boxscore)
}
