#' Process the team's complete game record
#'
#' Process for creating team box scores
#'
#' @param data cg_list or cgs_list (The result value of bind_cg_list or bind_cgs_list)
#' @param boxscore The result value of the pitcher_statistics function
#' @param teamname teamname
#' @return  CG or CGS
#' @examples
#' ## internal function
#' #team_dispose(cg_list,boxscore)

team_disposal <- function(data,boxscore,teamname){
  if(NROW(data)!=1){
    temp <- data.frame(table(data$year[data$team==teamname]))
    temp$Var1 <- as.character(temp$Var1)
    if(any(boxscore$period %in% temp$Var1) == FALSE){
      temp <- rbind(temp,data.frame(Var1=boxscore$period[boxscore$period %in% temp$Var1 ==FALSE],Freq=0))
    }
    temp <- temp[order(temp$Var1,decreasing = F),]
  }
  else{
    temp <- 0
  }
  return(temp)
}
