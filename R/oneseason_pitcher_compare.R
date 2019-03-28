#' Plot comparing two pitcher stats with one season
#'
#' This function draws a plot that compares two pitchers based on one season batter data.
#' This function has an option for yearly and monthly.
#' default: Based on the 2018 season, the month argument is NULL
#' If you put specific year in the yearly parameter, this function draws a pitching comparing plot of the corresponding year .
#' If you put specific month in the monthly parameter, this function draws a pitching comparison plot for the matched 2018 year and specific month.
#' If you put specific year and month in two parameters, this function draws a pitching comparison plot for the matched specific year and month.
#' If you are using MAC and Hangeul fonts are broken, type `theme_set(theme_gray(base_family = "AppleGothic"))`
#' @param data Default data is hanhwa_pitcher_2018 You can put other KBO pitcher data if you want.
#' @param playername1 Name of the batter you want to compare with playername1
#' @param playername2 NName of the batter you want to compare with playername2
#' @param id1 Defalut value is NULL. The first of the player id you want to compare
#' @param id2 Defalut value is NULL. The second of the player id you want to compare
#' @param yearly The default value is NULL Possible values are a specific year.
#' @param monthly The default value is NULL Possible values are a specific month.
#' @return Plots comparing two pitcher stats
#' @importFrom ggplot2 ggplot geom_bar theme ggtitle xlab ylab aes labs geom_text position_stack scale_fill_discrete
#' @importFrom gridExtra grid.arrange
#' @importFrom reshape2 melt
#' @importFrom dplyr filter
#' @examples
#' ## default: yearly=2018, monthly=NULL
#' oneseason_pitcher_compare(hanhwa_pitcher_2018,"정우람","송은범",yearly=2018)
#' ## yearly=2018, monthly="05"
#' oneseason_pitcher_compare(hanhwa_pitcher_2018,"정우람","송은범",yearly=2018,monthly="05")
#' @export

oneseason_pitcher_compare <- function(data=kbodatamining::hanhwa_pitcher_2018,playername1,playername2,id1=NULL,id2=NULL,yearly=2018,monthly=NULL){
  player_1 <- pitcher_boxscore(data = data,name = playername1,id=id1,yearly = yearly,monthly = monthly)
  player_2 <- pitcher_boxscore(data = data,name = playername2,id=id2,yearly = yearly,monthly = monthly)
  data <- rbind(player_1,player_2)
  player1_label <- paste(playername1,"_",player_1$id,sep = "")
  player2_label <- paste(playername2,"_",player_2$id,sep = "")
  reshape_data <- melt(data,id.vars = c("name", "period", "team", "id"))
  stat_data <- filter(reshape_data,reshape_data$variable %in% colnames(data)[c(1:9,11:17,20:21,27:29)])
  stat_plot <- ggplot(data = stat_data,aes(x=stat_data$variable,y=stat_data$value,fill=as.character(stat_data$id)))+
    geom_bar(stat="identity",position = "dodge")+theme(axis.text.x= element_text(angle=30, hjust=1))+
    ggtitle("Compare stats")+xlab("Stats")+ylab("Value")+labs(fill="player name and id")+
    scale_fill_discrete(labels=c(player1_label,player2_label))
  stat_data2 <- filter(reshape_data,reshape_data$variable %in% colnames(data)[c(18,19,27)])
  stat_plot2 <- ggplot(data = stat_data2,aes(x=stat_data2$variable,y=stat_data2$value,fill=as.character(stat_data2$id)))+
    geom_bar(stat="identity",position = "dodge")+theme(axis.text.x= element_text(angle=30, hjust=1))+
    ggtitle("Compare stats")+xlab("Stats")+ylab("Value")+labs(fill="player name and id")+
    scale_fill_discrete(labels=c(player1_label,player2_label))
  percent_data <- filter(reshape_data,reshape_data$variable %in% colnames(data)[c(10,22,23:27)])
  percent_plot <- ggplot(data = percent_data,aes(x=percent_data$variable,y=percent_data$value,fill=as.character(percent_data$id)))+
    geom_bar(stat="identity",position = "dodge")+ggtitle("Compare stats2")+
    xlab("Stats")+ylab("Value")+labs(fill="player name and id")+
    scale_fill_discrete(labels=c(player1_label,player2_label))
  return(grid.arrange(stat_plot,stat_plot2,percent_plot))
}
