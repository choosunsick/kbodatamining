#' Plot comparing two pitcher stats
#'
#' This function draws a plot that compares two pitcher based on the yearly pitcher data.
#' This function has an option monthly.
#' If you put in a specific month for monthly parameter,
#' you will compare the pitchers with the put in month data
#' @param data You can put yearly KBO pitcher data.
#' @param playername1 Name of the pitcher you want to compare
#' @param playername2 Name of the pitcher you want to compare
#' @param monthly The default value is NULL Possible values are a specific month.
# @param details The default value is FALSE, and if it is TRUE, it shows the data to be compared.
#' @return Plots comparing two pitcher stats per year
#' @examples
#' ## not run
#' ## You can refer to the Readme file to obtain the annual KBO data
#' ## default:monthly=NULL
#' ## yearly_compare_pitcher(yearly_KBO_data,"정우람","이태양")
#' ## monthly="05
#' ## yearly_compare_pitcher(yearly_KBO_data,"정우람","이태양",monthly="05")
#' @export

yearly_compare_pitcher <- function(data,playername1,playername2,monthly=NULL){
  if(NROW(unique(substr(data$date,1,4)))==1){
    stop("It is not an annual data source and Use the oneseason_compare_pitcher function.")
  }
  data <- make_plot4pitcher_data(data,playername1,playername2,yearly = NULL,monthly)
  plot <- yearly_pitcher_plot(data)
  #if(details==TRUE){
  #  return(list(data,plot))
  #}
  #else{
  return(plot)
  #}
}
