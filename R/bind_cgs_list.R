#' Complete game Shutout rbind dataframe
#'
#' The calculated Complete game Shutout data frames are grouped into one data frame.
#'
#' @param data KBO pitcher data
#' @param team KBO team name
#' @return Complete game player and CGS count data frame for all teams
#' @examples
#' ## internal function:
#' ## This function creates Complete game data for the pitcher's boxscore.
#' # bind_cgs_list(hanhwa_pitcher_2018,"한화")


bind_cgs_list <- function(data,team){
  cgs_list <- unique(do.call(rbind,lapply(unique(team),function(x)cgs_calculate(data,x))))
  if(NROW(cgs_list)!=0){
    cgs_list[,1:3] <- do.call(cbind,lapply(cgs_list[,1:3],function(x)as.character(x)))
  }
  else{
    cgs_list <- 0
  }

  return(cgs_list)
}
