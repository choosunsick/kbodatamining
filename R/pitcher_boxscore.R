#' The box score of the pitcher player
#'
#' This function creates annual or periodical box score of the pitcher.
#' This function has options called 'yearly' or 'monthly'.
#' default: The player's annual box score is created.
#' If you put a year in the yearly parameter, it calculates the box score of corresponding year.
#' If you put a month in the monthly parameter, it calculates the corresponding monthly box score of every year.
#' If you put a year and a month in each parameters, the box score of corresponding month you put in is created.
#' If you are looking for a player who has the same name with other players, you need to find the player's ID and put it in the 'ID' parameter.
#' @param data 'Hanhwa_pitcher_2018' is default data. You can put another kbo batter data if you want.
#' @param name The name of the batter you want
#' @param id  This is not a required parameter. The ID parameter is a numeric type.
#' @param yearly The default value is NULL. Possible value is a specific year.
#' @param monthly The default value is NULL. Possible value is a specific month. The monthly parameter is a string type.
#' @return The pitcher box score of the year or month put in is created.
#' @examples
#' ## default: id=NULL, yearly=NULL, monthly=NULL
#' pitcher_boxscore(hanhwa_pitcher_2018,"정우람")
#' ## id=NULL, yearly=2018, monthly=NULL
#' pitcher_boxscore(hanhwa_pitcher_2018,"정우람",yearly=2018)
#' ## id=NULL, yearly=NULL, monthly="05"
#' pitcher_boxscore(hanhwa_pitcher_2018,"정우람",monthly="05")
#' ## id=NULL, yearly=2018, monthly="05"
#' pitcher_boxscore(hanhwa_pitcher_2018,"정우람",yearly=2018,monthly="05")
#' @export
#팀과 선수 분리 해야함
pitcher_boxscore <- function(data=kbodatamining::hanhwa_pitcher_2018,name,id=NULL,yearly=NULL,monthly=NULL){
  boxscore <- date_test(data,name,id,yearly,monthly,pitcher_statistics)
  if(is.null(id)==TRUE & name_test(name)=="not_samename"){
    id <- find_player_id(name)$id
  }
  boxscore <- cbind(name=name,boxscore,id=id)
  cg_list <- player_disposal(bind_cg_list(data,boxscore$record.team),boxscore)
  cgs_list <- player_disposal(bind_cgs_list(data,boxscore$record.team),boxscore)
  if(NCOL(cg_list)!=1 & NCOL(cgs_list)!=1){
    boxscore <- cbind(boxscore,cg_list$Freq[match(boxscore$period,cg_list$Var1)],cgs_list$Freq[match(boxscore$period,cgs_list$Var1)])
  }
  else if(NCOL(cg_list)!=1 & NCOL(cgs_list)==1){
    boxscore <- cbind(boxscore,cg_list$Freq[match(boxscore$period,cg_list$Var1)],cgs_list)
  }
  else{
    boxscore <- cbind(boxscore,cg_list,cgs_list)
  }
  colnames(boxscore)<-c("name","period","team","g","away","home","win","lose","draw","wpct","sv","hld","ip","r","er","k","bb&hbp","pit",
                        "tbf","ha","hra","era","p_ip","k_9","hr_9","oba","id","cg","cgs")
  boxscore[is.na(boxscore)==TRUE]<-0
  return(boxscore)
}
