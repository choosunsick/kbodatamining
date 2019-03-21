#' Batting record count
#'
#' This function counts the number of batting records you put in.
#'
#' @param data KBO batter data
#' @param record_factor This is the category of batting to find, and it should be a string type.
#' @return Sum of the batter records in every innings
#' @examples
#' lee <- find_player(hanhwa_batter_2018,"이용규",NULL)
#' inning <- c('one','two','three','four','five','six','seven','eight','nine','ten','eleven','twelve')
#' inning_data <- subset(lee,select=inning)
#' factor_count(data=inning_data,record_factor="10")
#' @export

factor_count <- function(data,record_factor){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- subset(x=data,select = inning)
  check_one <- sum(do.call(rbind,lapply(colnames(data),function(x)grepl(record_factor,substr(data[,x],1,2)))))
  check_two <- sum(do.call(rbind,lapply(colnames(data),function(x)grepl(record_factor,substr(data[,x],5,6)))))
  return(check_one+check_two)
}
