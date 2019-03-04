#'Plot comparing two batter stats
#'
#' This function draws a plot that compares two batters based on the yearly batter data.
#' This function has an option monthly.
#' If you put in a specific month for monthly parameter, you will compare the batters with the put in month data
#' ## You can refer to the Readme file to obtain the annual KBO data
#' @param data KBO batter data over 2 seasons
#' @param playername1 Name of the batter you want to compare
#' @param playername2 Name of the batter you want to compare
#' @param monthly The default value is NULL, Possible values are a specific month string such as "05".
#' @return Four plots comparing the four records(G, AVG, OPS, BABIP) of the players entered
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
