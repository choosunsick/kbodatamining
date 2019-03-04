#' Complete game Shutout rbind dataframe
#'
#' The calculated Complete game Shutout data frames are grouped into one data frame.
#'
#' @param data KBO pitcher data
#' @param team KBO team name
#' @return Complete game player and CGS count data frame for all teams
#' @examples
#' bind_cgs_list(hanhwa_pitcher_2018,"한화")
#' @export

bind_cgs_list <- function(data,team){
  cgs_list <- data.frame(stringsAsFactors = F)
  for(i in unique(team)){
    cgs_list <- rbind(cgs_list,cgs_calculate(data,i))
  }
  if(NROW(cgs_list)!=0){
    cgs_list[,1:3] <- do.call(cbind,lapply(cgs_list[,1:3],function(x)as.character(x)))
  }
  else{
    cgs_list <- 0
  }

  return(cgs_list)
}
