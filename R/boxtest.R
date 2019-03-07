#' Inspection to distitinguish player names from team names
#'
#' Creates a box score to distinguish whether the name is a team name or not.
#'
#' @param name KBO pitcher name or KBO Team
#' @param boxscore The result value of the pitcher_statistics function
#' @param cg_list The result value of the bind_cg_list function
#' @param cgs_list The result value of the bind_cgs_list function
#' @return Annual box score records for players or teams
#' @examples
#' ## internal function
#' #name_test("한화",boxscore,cg_list,cgs_list)
##테스트 해볼것 모든팀 테스트 해야함, 일부 선수들로 테스트 일단 함수상 오류는 없음
boxscore_test <- function(name,boxscore,cg_list,cgs_list){
  if(name_test(name)=='team'){
    cg <- team_disposal(cg_list,boxscore,name)
    cgs <- team_disposal(cgs_list,boxscore,name)
    if(NROW(cg)!=1 &NROW(cgs)!=1){
      boxscore <- cbind(boxscore,cg$Freq[match(boxscore$period,cg$Var1)],cgs$Freq[match(boxscore$period,cgs$Var1)])
    }
    else if(NROW(cg)!=1 &NROW(cgs)==1){
      boxscore <- cbind(boxscore,cg$Freq[match(boxscore$period,cg$Var1)],cgs)
    }
    else{
      boxscore <- cbind(boxscore,cg,cgs)
    }
    colnames(boxscore)<-c("period","team","g","away","home","win","lose","draw","wpct","sv","hld","ip","r","er","k","bb&hbp","pit",
                            "tbf","ha","hra","era","p_ip","k_9","hr_9","oba","cg","cgs")
    }
  else{
    cg <- player_disposal(cg_list,boxscore,name)
    cgs <- player_disposal(cgs_list,boxscore,name)
    if(NROW(cg)!=1 & NROW(cgs)!=1){
      boxscore <- cbind(name,boxscore,cg$Freq[match(boxscore$period,cg$Var1)],cgs$Freq[match(boxscore$period,cgs$Var1)])
    }
    else if(NROW(cg)!=1 & NROW(cgs)==1){
      boxscore <- cbind(name,boxscore,cg$Freq[match(boxscore$period,cg$Var1)],cgs)
    }
    else{
      boxscore <- cbind(name,boxscore,cg,cgs)
    }
    colnames(boxscore)<-c("name","period","team","g","away","home","win","lose","draw","wpct","sv","hld","ip","r","er","k","bb&hbp","pit",
                            "tbf","ha","hra","era","p_ip","k_9","hr_9","oba","cg","cgs")
  }
  boxscore[is.na(boxscore)==TRUE]<-0
  return(boxscore)
}
