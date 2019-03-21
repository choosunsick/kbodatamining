#' Plot comparing stats of two batter during one season
#'
#' This function creates a plot that compares two batters based on batter data of one season.
#' This function has options called 'yearly' or 'monthly'.
#' default: Based on the 2018 season, the 'monthly' parameter is NULL
#' If you put specific year in the yearly parameter, this function draws a batting comparing plot of the corresponding year .
#' If you put specific month in the monthly parameter, draws a batting comparison plot for the matched 2018 year and specific month.
#' If you put specific year and month in two parameters, draws a batting comparison plot for the matched specific year and month.
#' If you are using MAC and Hangeul fonts are broken, type `theme_set(theme_gray(base_family = "AppleGothic"))`
#' @param data Default data is hanhwa_batter_2018 You can put other kbo batter data if you want.
#' @param playername1 The first of the player you want to compare
#' @param playername2 The second of the player you want to compare
#' @param yearly The default value is 2018 Possible values are a specific year.
#' @param monthly The default value is NULL Possible values are a specific month.
#' @importFrom ggplot2 ggplot geom_bar theme ggtitle xlab ylab aes labs
#' @importFrom gridExtra grid.arrange
#' @importFrom rlang .data
#' @importFrom reshape2 melt
#' @importFrom dplyr filter
#' @return Plots comparing two batter stats
#' @examples
#' ## default: yearly=2018, monthly=NULL
#' oneseason_compare_batter(hanhwa_batter_2018,"이용규","정근우",yearly=2018)
#' ## yearly=2018, monthly="05"
#' oneseason_compare_batter(hanhwa_batter_2018,"이용규","정근우",yearly=2018,monthly="05")
#' @export

oneseason_compare_batter <- function(data=kbodatamining::hanhwa_batter_2018,playername1,playername2,yearly=2018,monthly=NULL){
  data <- make_batter_data_4plot(data,playername1,playername2,yearly,monthly)
  stat_data <- filter(melt(data,1:3),.data$variable %in% colnames(data)[1:23])
  stat_plot <- ggplot(data = stat_data,aes(x=.data$variable,y=.data$value,fill=.data$name))+
    geom_bar(stat="identity",position = "dodge")+theme(axis.text.x= element_text(angle=30, hjust=1))+
    ggtitle("Compare stats")+xlab("Stats")+ylab("Value")+labs(fill="player names")
  percent_data <- filter(melt(data,1:3),.data$variable %in% colnames(data)[24:28])
  stat_plot2 <- ggplot(data = percent_data,aes(x=.data$variable,y=.data$value,fill=.data$name))+
    geom_bar(stat="identity",position = "dodge")+ggtitle("Compare stats2")+
    xlab("Stats")+ylab("Value")+labs(fill="player names")
  return(grid.arrange(stat_plot,stat_plot2))
}
