#' Plot comparing two pitcher stats
#'
#' This function draws a plot that compares two pitcher based on the yearly pitcher data.
#' This function has an option monthly.
#' If you put in a specific month for monthly parameter, you will compare the pitchers with the put in month data
#' ## You can refer to the Readme file to obtain the annual KBO data
#' @param data KBO pitcher data over 2 seasons
#' @param playername1 Name of the pitcher you want to compare
#' @param playername2 Name of the pitcher you want to compare
#' @param monthly  The default value is NULL, Possible values are a specific month string such as "05"
#' @return Four plots comparing the four records(G, AVG, OPS, BABIP) of the players entered
#' @examples
#' ## not run
#' ## You can refer to the Readme file to obtain the annual KBO data
#' ## default:monthly=NULL
#' ## yearly_compare_pitcher(yearly_KBO_data,"정우람","송은범")
#' ## monthly="05
#' ## yearly_compare_pitcher(yearly_KBO_data,"정우람","이태양",monthly="05")
#' @export

yearly_compare_pitcher <- function(data,playername1,playername2,monthly=NULL){
  data <- make_pitcher_data_4plot(data,playername1,playername2,yearly = NULL,monthly)
  plot <- yearly_pitcher_plot(data)

  return(plot)
}
