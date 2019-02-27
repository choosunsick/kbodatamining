#' Complete game calculate function
#'
#' Calculate Complete game
#'
#' @param data KBO pitcher data
#' @param team KBO team name
#' @return Complete game player and cg count dataframe
#' @examples
#' ## internal function
#' #cg_calculate(hanhwa_pitcher_2018,"한화")

cg_calculate <- function(data,team){
  data <- find_team(data,team)
  cg_list <- data.frame()
  for(i in unique(data$date)){
    if(NROW(data[data$date==i,])==1){
      cg_list <- rbind(cg_list,data.frame(name=data$name[data$date==i],cg=1))
    }
  }
  return(cg_list)
}
