#' Plot comparing two batter stats
#'
#' This function draws a plot that compares two batters based on the yearly batter data.
#' This function has an option monthly.
#' If you put in a specific month for monthly parameter,
#' you will compare the batters with the put in month data
#' @param data You can put yearly KBO batter data.
#' @param playername1 Name of the batter you want to compare
#' @param playername2 Name of the batter you want to compare
#' @param monthly The default value is NULL Possible values are a specific month.
#' @return Plots comparing two batter stats per year
#' @examples
#' ## not run
#' ## You can refer to the Readme file to obtain the annual KBO data
#' ## if
#' ## default:monthly=NULL
#' ## yearly_compare_batter(hanhwa_batter_2018,"이용규","정근우")
#' ## monthly="05
#' ## yearly_compare_batter(hanhwa_batter_2018,"이용규","정근우",monthly="05")
#' @export

yearly_compare_batter <- function(data,playername1,playername2,monthly=NULL){
  if(NROW(unique(substr(data$date,1,4)))==1){
    stop("It is not an annual data source and Use the oneseason_compare_batter function.")
  }
  data <- make_plot_data(data,playername1,playername2,yearly = NULL,monthly)
  return(yearly_plotting(data))
}
