#' Complete game Shutout calculate function
#'
#' Calculate Complete game Shutout
#'
#' @param data KBO pitcher data
#' @return Complete game Shutout dataframe
#' @examples
#' ## internal function
#' #cgs_calculate(find_team(hanhwa_pitcher_2018,"한화"))

cgs_calculate <- function(data){
  cgs_list <- data.frame()
  for(i in unique(data$date)){
    if(all(NROW(data[data$date==i,])==1 & data$r[data$date==i]==0)==TRUE){
      cgs_list <- rbind(cgs_list,data.frame(name=data$name[data$date==i],cgs=1))
    }
  }
  return(cgs_list)
}
