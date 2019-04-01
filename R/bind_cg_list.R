#' Make Complete game list
#'
#' Creating a complete game list from data.
#'
#' @param data KBO pitcher data
#' @param team KBO team name
#' @return Complete game player and CG count data frame for all teams
#' @examples
#' ## internal function:
#' ## This function creates Complete game data for the pitcher's boxscore.
#' # bind_cg_list(hanhwa_pitcher_2018,"한화")


bind_cg_list <- function(data,team){
  cg_list <- unique(do.call(rbind,lapply(unique(team),function(x)cg_calculate(data,x))))

  if(NROW(cg_list)!=0){
    cg_list[,1:3] <- do.call(cbind,lapply(cg_list[,1:3],function(x)as.character(x)))
  }
  else{
    cg_list <- 0
  }

  return(cg_list)
}
