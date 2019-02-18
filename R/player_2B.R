#' Calculating batter's Double
#'
#' This function calculates The Double for the specified player.
#' This function has an option for yearly and monthly.
#' default: the annualy Double is calculated
#' If only the monthly parameter is TRUE, the monthly Double is calculated
#' If you put a year in the yearly parameter, it calculates the Double for that year.
#' If you put a month in the monthly parameter, it calculates the corresponding monthly Double.
#' If you put a year and a month in two parameter, the Double for the time period you put in is calculated.
#' @param data KBO Batter data
#' @param playername The name of the batter you want
#' @param yearly The default value is TRUE Possible values are a specific year or a FALSE value.
#' @param monthly The default value is FALSE. Possible values are a specific month or a TRUE value.
#' @return Batter's Double. for the year, month, or period put in is calculated.
#' @examples
#' ## default
#' player_2B(hanhwa_batter_2018,"이용규")
#' ## yearly=FALSE, monthly=TRUE
#' player_2B(hanhwa_batter_2018,"이용규",yearly=FALSE,monthly=TRUE)
#' ## yearly=TRUE, monthly=TRUE #error case
#' ##player_2B(hanhwa_batter_2018,"이용규",yearly=TRUE,monthly=TRUE)
#' ## yearly=2018, monthly=FALSE
#' player_2B(hanhwa_batter_2018,"이용규",yearly=2018)
#' ## yearly= TRUE, monthly=05
#' player_2B(hanhwa_batter_2018,"이용규",yearly=TRUE,monthly="05")
#' ## yearly=2018,monthly=05
#' player_2B(hanhwa_batter_2018,"이용규",yearly=2018,monthly="05")
#' @export

player_2B <-  function(data,playername,yearly=TRUE,monthly=FALSE){
  data <- find_player(data,playername)
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  if(yearly == TRUE & monthly==FALSE){
    temp <- list()
    for(i in unique(substr(data$date,1,4))){
      colname <- paste("year","_",i,sep = "")
      inning_data <- data[substr(data$date,1,4)==i,c(inning)]
      temp[colname] <- factor_count(inning_data,"11")
    }
    temp <- data.frame(temp)
  }
  else if(yearly==FALSE & monthly==TRUE){
    temp <- list()
    for(i in unique(substr(data$date,6,7))){
      colname <- paste("month","_",i,sep = "")
      inning_data <- data[substr(data$date,6,7)==i,c(inning)]
      temp[colname] <- factor_count(inning_data,"11")
    }
    temp <- data.frame(temp)
  }
  else if(is.numeric(yearly)==TRUE & monthly==FALSE){
    inning_data <- data[substr(data$date,1,4)==yearly,c(inning)]
    temp <- factor_count(inning_data,"11")
  }
  else if(is.numeric(yearly)==TRUE & monthly==TRUE){
    temp <- list()
    for(i in unique(substr(data$date,6,7))){
      colname <- paste("month","_",i,sep = "")
      inning_data <- data[substr(data$date,1,4)==yearly&substr(data$date,6,7)==i,c(inning)]
      temp[colname] <- factor_count(inning_data,"11")
    }
    temp <- data.frame(temp)
  }
  else if(yearly==TRUE & is.character(monthly)==TRUE){
    temp <- list()
    for(i in unique(substr(data$date,1,4))){
      colname <- paste("date",i,"_",monthly,sep = "")
      inning_data <- data[substr(data$date,1,4)==i&substr(data$date,6,7)==monthly,c(inning)]
      temp[colname] <- factor_count(inning_data,"11")
    }
    temp <- data.frame(temp)
  }
  else if(is.numeric(yearly)==TRUE & is.character(monthly)==TRUE){
    inning_data <- data[substr(data$date,1,4)==yearly&substr(data$date,6,7)==monthly,c(inning)]
    temp <- factor_count(inning_data,"11")
  }
  else{
    stop("The use of the yearly and monthly arguments is incorrect.")
  }
  return(temp)
}
