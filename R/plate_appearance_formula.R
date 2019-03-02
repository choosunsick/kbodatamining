#' The number of Plate appearance calculate function
#'
#' Calculate PA in the data
#'
#' @param data KBO batter inning data
#' @return data's PA
#' @importFrom dplyr select
#' @examples
#' pa_formula(hanhwa_batter_2018)
#' @export
pa_formula <- function(data){
  inning <- c('one','two','three','four','five','six','seven','eight', 'nine','ten','eleven','twelve')
  data <- select(data,inning)
  pa <- sum(do.call(rbind,lapply(colnames(data),function(x)sum(ifelse(nchar(data[,x][data[,x]!=0])==8,2,1)))))
  return(pa)
}
