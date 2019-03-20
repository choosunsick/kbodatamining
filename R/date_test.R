#' yearly and monthly argument test
#'
#' Tests whether the two arguments are null.
#'
#' @param data Default is hanhwa's batter data, You can include the entire KBO data if you wish.
#' @param name The name of the batter or the team you want
#' @param id  Default is NULL, but you can put in Player id of player with same name
#' @param yearly Default is NULL, but you can put in the year
#' @param monthly Default is NULL, but you can put in the month
#' @param recordname The name of the record you want
#' @return Record dataframe by period according to test
#' @importFrom dplyr filter %>%
#' @importFrom rlang .data
#' @examples
#' date_test(hanhwa_batter_2018,"이용규",NULL,NULL,NULL,avg_formula)
#' @export
date_test <- function(data,name,id,yearly,monthly,recordname){
  if(is.null(yearly) == TRUE & is.null(monthly) == TRUE){
     temp <- yearly_record(data,name,id,recordname)
  }
  else if(is.null(yearly) == TRUE & is.null(monthly) == FALSE){
    if(is.character(monthly)==FALSE){
      stop("The monthly argument must be a string.")
    }
    else{
      monthly <- ifelse(nchar(monthly)==1,paste(0,monthly,sep=""),monthly)
      }
    temp <- yearly_month_record(data,name,id,recordname,monthly)
  }
  else if(is.null(yearly) == FALSE & is.null(monthly) == TRUE){
    if(nchar(yearly)!=4){
      stop("The yearly argument must be a 4-digit number type.")
    }
    temp <- yearly_record(data,name,id,recordname) %>% filter(.data$period==yearly)
  }
  else if(is.null(yearly) == FALSE & is.null(monthly) == FALSE){
    if(nchar(yearly)!= 4 | is.character(monthly)==FALSE){
      stop("The use of the yearly or monthly arguments is incorrect.")
    }
    else{
      monthly <- ifelse(nchar(monthly)==1,paste(0,monthly,sep=""),monthly)
    }
    temp <- year_month_record(data,name,id,recordname,yearly,monthly)
  }
  if(NROW(temp)==0){
    stop("There is no data for the time period you put.")
  }
  if("record.team" %in% colnames(temp)){
    temp$record.team <- as.character(temp$record.team)
  }
  temp$period <- as.character(temp$period)
  return(temp)
}
