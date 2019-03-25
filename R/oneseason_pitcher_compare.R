#' Plot comparing two pitcher stats with one season
#'
#' This function draws a plot that compares two pitchers based on one season batter data.
#' This function has an option for yearly and monthly.
#' default: Based on the 2018 season, the month argument is NULL
#' If you put specific year in the yearly parameter, this function draws a pitching comparing plot of the corresponding year .
#' If you put specific month in the monthly parameter, draws a pitching comparison plot for the matched 2018 year and specific month.
#' If you put specific year and month in two parameters, draws a pitching comparison plot for the matched specific year and month.
#' If you are using MAC and Hangeul fonts are broken, type `theme_gray (base_family = "AppleGothic"))`
#' @param data Default data is hanhwa_pitcher_2018 You can put other KBO pitcher data if you want.
#' @param playername1 Name of the batter you want to compare with playername1
#' @param playername2 NName of the batter you want to compare with playername2
#' @param yearly The default value is NULL Possible values are a specific year.
#' @param monthly The default value is NULL Possible values are a specific month.
#' @return Plots comparing two pitcher stats
#' @importFrom ggplot2 ggplot geom_bar theme ggtitle xlab ylab aes labs
#' @importFrom gridExtra grid.arrange
#' @importFrom rlang .data
#' @importFrom reshape2 melt
#' @importFrom dplyr filter
#' @examples
#' ## default: yearly=2018, monthly=NULL
#' oneseason_compare_pitcher(hanhwa_pitcher_2018,"정우람","이태양",yearly=2018)
#' ## yearly=2018, monthly="05"
#' oneseason_compare_pitcher(hanhwa_pitcher_2018,"정우람","이태양",yearly=2018,monthly="05")
#' @export

oneseason_compare_pitcher <- function(data=kbodatamining::hanhwa_pitcher_2018,playername1,playername2,yearly=2018,monthly=NULL){
  player_1 <- kbodatamining::pitcher_boxscore(data = data,name = playername1,yearly = yearly,monthly = monthly)
  player_2 <- kbodatamining::pitcher_boxscore(data = data,name = playername2,yearly = yearly,monthly = monthly)
  data <- rbind(player_1,player_2)
  stat_data <- filter(melt(data,1:3),.data$variable %in% colnames(data)[c(1:9,11:21,23:24,27:28)])
  stat_plot <- ggplot(data = stat_data,aes(x=.data$variable,y=.data$value,fill=.data$name))+
    geom_bar(stat="identity",position = "dodge")+theme(axis.text.x= element_text(angle=30, hjust=1))+
    ggtitle("Compare stats")+xlab("Stats")+ylab("Value")+labs(fill="player names")
  percent_data <- filter(melt(data,1:3),.data$variable %in% colnames(data)[c(10,22,25:26)])
  stat_plot2 <- ggplot(data = percent_data,aes(x=.data$variable,y=.data$value,fill=.data$name))+
    geom_bar(stat="identity",position = "dodge")+ggtitle("Compare stats2")+
    xlab("Stats")+ylab("Value")+labs(fill="player names")
  return(grid.arrange(stat_plot,stat_plot2))
}
