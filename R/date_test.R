#' yearly and monthly argument test
#'
#' Tests whether the two arguments are null.
#'
#' @param data Default is hanhwa's batter data, You can include the entire KBO data if you wish.
#' @param playername The name of the batter you want
#' @param recordname The name of the record you want
#' @param yearly Default is NULL, but you can put in the year
#' @param monthly Default is NULL, but you can put in the month
#' @return Record dataframe by period according to test
#' @importFrom dplyr filter %>%
#' @importFrom rlang .data
#' @examples
#' #date_test(hanhwa_batter_2018,"이용규",NULL,NULL,avg_formula)
#' @export
date_test <- function(data,playername,yearly,monthly,recordname){
  if(is.null(yearly) == TRUE & is.null(monthly) == TRUE){
     temp <- yearly_record(data,playername,recordname)
  }
  else if(is.null(yearly) == TRUE & is.null(monthly) == FALSE){
    if(is.character(monthly)==FALSE){
      stop("The use of the monthly argument is incorrect.")
    }
    else{
      monthly <- ifelse(nchar(monthly)==1,paste(0,monthly,sep=""),monthly)
      }
    temp <- yearly_month_record(data,playername,recordname,monthly)
  }
  else if(is.null(yearly) == FALSE & is.null(monthly) == TRUE){
    if(nchar(yearly)!=4){
      stop("The use of the yearly argument is incorrect.")
    }
    temp <- yearly_record(data,playername,recordname) %>% filter(.data$period==yearly)
  }
  else if(is.null(yearly) == FALSE & is.null(monthly) == FALSE){
    if(nchar(yearly)!= 4 | is.character(monthly)==FALSE){
      stop("The use of the yearly or monthly arguments is incorrect.")
    }
    else{
      monthly <- ifelse(nchar(monthly)==1,paste(0,monthly,sep=""),monthly)
    }
    temp <- year_month_record(data,playername,recordname,yearly,monthly)
  }
  return(temp)
}
