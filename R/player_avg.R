#' Calculate batting average
#'
#' This function calculates the batting average for the specified player.
#' This function has an option for yearly and monthly.
#' default: the annual AVG is calculated
#' If only the monthly parameter is TRUE, the monthly AVG is calculated
#' If you put a year in the yearly parameter, it calculates the AVG for that year.
#' If you put a month in the monthly parameter, it calculates the corresponding monthly AVG.
#' If you put a year and a month in two parameter, the AVG for the time period you put is calculated.
#' @param data KBO Batter data
#' @param playername The name of the batter you want
#' @param yearly The default value is FALSE. Possible values are a specific year or a TRUE value.
#' @param monthly The default value is FALSE. Possible values are a specific month or a TRUE value.
#' @return The batting average for the year, month, or period entered is calculated.
#' @importFrom dplyr "%>%"
#' @examples
#' ## default
#' player_avg(hanhwa_batter_2018,"이용규")
#' ## yearly=FALSE, monthly=TRUE
#' player_avg(hanhwa_batter_2018,"이용규",yearly=FALSE,monthly=TRUE)
#' ## yearly=TRUE, monthly=TRUE #error case
#' player_avg(hanhwa_batter_2018,"이용규",yearly=TRUE,monthly=TRUE)
#' ## yearly=2018, monthly=FALSE
#' player_avg(hanhwa_batter_2018,"이용규",yearly=2018)
#' ## yearly=FALSE, monthly=05
#' player_avg(hanhwa_batter_2018,"이용규",yearly=FALSE,monthly=05)
#' ## yearly=2018,monthly=05
#' player_avg(hanhwa_batter_2018,"이용규",yearly=2018,monthly=05)
#' @export
player_avg <- function(data,playername,yearly=TRUE,monthly=FALSE){
  data <- data[data$name == playername,]
  if(yearly == TRUE & monthly==FALSE){
    avg <- list()
    for(i in unique(substr(data$date,1,4))){
      colname<- paste("year","_",i,sep = "")
      avg[colname] <- avg_formula(data$h[substr(data$date,1,4)==i],data$ab[substr(data$date,1,4)==i])
    }
    avg <- data.frame(avg)
  }
  else if(yearly==FALSE & monthly==TRUE){
    avg <- list()
    for(i in unique(substr(data$date,6,7))){
      colname<- paste("month","_",i,sep = "")
      avg[colname] <- avg_formula(data$h[substr(data$date,6,7)==i],data$ab[substr(data$date,6,7)==i])
    }
    avg <- data.frame(avg)
  }
  else if(is.numeric(yearly)==TRUE & monthly==FALSE){
    avg <- data$h[substr(data$date,1,4)==yearly] %>%
      avg_formula(data$ab[substr(data$date,1,4)==yearly])
  }
  else if(yearly==FALSE & is.character(monthly)==TRUE){
    avg <- list()
    for(i in unique(substr(data$date,1,4))){
      colname <- paste("date",i,"_",monthly,sep = "")
      temp <- data[substr(data$date,1,4)==i&substr(data$date,6,7)==monthly,]
      avg[colname] <- avg_formula(temp$h,temp$ab)
    }
    avg <- data.frame(avg)
  }
  else if(is.numeric(yearly)==TRUE & is.character(monthly)==TRUE){
    avg <- data$h[substr(data$date,1,4)==yearly&substr(data$date,6,7)==monthly] %>%
      avg_formula(data$ab[substr(data$date,1,4)==yearly&substr(data$date,6,7)==monthly])
  }
  else{
    return("Reread the description of the yearly and monthly arguments and use the function")
  }
  return(avg)
}
