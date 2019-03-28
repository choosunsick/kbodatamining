#' Process the team's complete game record
#'
#' Process for creating team box scores
#'
#' @param data cg_list or cgs_list (The result value of cg_calculate or cgs_calculate)
#' @param boxscore The result value of the pitcher_statistics function
#' @param teamname teamname
#' @return yearly CG or CGS
#' @examples
#' ## internal function
#' ## not run
#' # boxscore <- date_test(data=hanhwa_pitcher_2018,teamname="한화",id=NULL,2018,NULL,pitcher_statistics)
#' # team_disposal(cg_calculate(hanhwa_pitcher_2018,"한화"),boxscore,"한화")

team_disposal <- function(data,boxscore,teamname){
  if(NROW(data)!=1){
    data$year <- substr(data$date,1,4)
    temp <- data.frame(table(data$year[data$team==teamname]))
    temp$Var1 <- as.character(temp$Var1)
    if(any(boxscore$period %in% temp$Var1) == FALSE){
      temp <- rbind(temp,data.frame(Var1=boxscore$period[boxscore$period %in% temp$Var1 ==FALSE],Freq=0))
    }
    temp <- temp[order(temp$Var1,decreasing = F),]
  }
  else{
    temp <-0
  }
  return(temp)
}
