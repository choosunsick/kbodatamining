#' Process the player's complete game record
#'
#' Process for creating player box scores
#'
#' @param data cg_list or cgs_list (The result value of bind_cg_list or bind_cgs_list)
#' @param boxscore The result value of the pitcher_statistics function
#' @param name player name
#' @return boxscore with CG or CGS
#' @examples
#' ## internal function
#' #player_disposal(cg_list,boxscore)

player_disposal <- function(data,boxscore,name){
  if(NROW(data)!=1){
    if(name %in% data$name)
      temp <- data.frame(table(data$year[data$name==name]))
      temp$Var1 <- as.character(temp$Var1)
      if(any(boxscore$period %in% temp$Var1) ==FALSE){
        temp <- rbind(temp,data.frame(Var1=boxscore$period[boxscore$period %in% temp$Var1 ==FALSE],Freq=0))
     }
      temp <- temp[order(temp$Var1,decreasing = F),]
  }
  else{
    temp <- 0
  }
  return(temp)
}
