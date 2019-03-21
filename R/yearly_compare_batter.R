#' Plot comparing annual stats of two batters
#'
#' This function draws a plot that compares two batters based on annual batter data.
#' This function has options called monthly.
#' If you put a month in the monthly parameter, it calculates the corresponding monthly compare plot of every year.
#' You can refer to the Readme file to obtain the annual KBO data
#' @param data KBO batter data over 2 seasons
#' @param playername1 Name of the batter you want to compare
#' @param playername2 Name of the batter you want to compare
#' @param monthly The default value is NULL, Possible values are a specific month string such as "05"
#' @return Four plots comparing the four records(G, AVG, OPS, BABIP) of the players' name you entered
#' @examples
#' ## not run
#' ## default:monthly=NULL
#' ## yearly_compare_batter(yearly_KBO_data,"이용규","정근우")
#' ## monthly="05
#' ## yearly_compare_batter(yearly_KBO_data,"이용규","정근우",monthly="05")
#' @export

yearly_compare_batter <- function(data,playername1,playername2,monthly=NULL){
  data <- make_batter_data_4plot(data,playername1,playername2,yearly = NULL,monthly)
  plot <- yearly_batter_plot(data)
  return(plot)

}
