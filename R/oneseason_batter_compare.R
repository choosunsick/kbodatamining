#' Plot comparing stats of two batter during one season
#'
#' This function creates a plot that compares two batters based on batter data of one season.
#' This function has options called 'yearly' or 'monthly'.
#' default: The 'yearly' parameter is 2018. The 'monthly' parameter is NULL
#' If you put specific year in the yearly parameter, this function draws a batting comparing plot of the corresponding year .
#' If you put specific month in the monthly parameter, this function draws a batting comparison plot for the matched 2018 year and specific month.
#' If you put specific year and month in two parameters, this function draws a batting comparison plot for the matched specific year and month.
#' If you are using MAC and Hangeul fonts are broken, type `theme_set(theme_gray(base_family = "AppleGothic"))`
#' @param data Default data is hanhwa_batter_2018. You can put other KBO batter data.
#' @param playername1 The first of the player you want to compare
#' @param playername2 The second of the player you want to compare
#' @param id1 Defalut value is NULL. The first of the player id you want to compare
#' @param id2 Defalut value is NULL. The second of the player id you want to compare
#' @param yearly The default value is 2018 Possible values are a specific year.
#' @param monthly The default value is NULL Possible values are a specific month.
#' @importFrom ggplot2 ggplot geom_bar theme ggtitle xlab ylab aes labs scale_fill_discrete
#' @importFrom gridExtra grid.arrange
#' @importFrom reshape2 melt
#' @importFrom dplyr filter
#' @return Plots comparing two batter stats
#' @examples
#' ## default: yearly=2018, monthly=NULL
#' oneseason_batter_compare(hanhwa_batter_2018,"이용규","정근우",yearly=2018)
#' ## yearly=2018, monthly="05"
#' oneseason_batter_compare(hanhwa_batter_2018,"이용규","정근우",yearly=2018,monthly="05")
#' @export

oneseason_batter_compare <- function(data=kbodatamining::hanhwa_batter_2018,playername1,playername2,id1=NULL,id2=NULL,yearly=2018,monthly=NULL){
  player_1 <- batter_boxscore(data = data,name = playername1,id=id1,yearly = yearly,monthly = monthly)
  player_2 <- batter_boxscore(data = data,name = playername2,id=id2,yearly = yearly,monthly = monthly)
  data <- rbind(player_1,player_2)
  player1_label <- paste(playername1,"_",player_1$id,sep = "")
  player2_label <- paste(playername2,"_",player_2$id,sep = "")
  reshape_data <- melt(data,id.vars = c("name", "period", "team", "id"))
  stat_data <- filter(reshape_data,reshape_data$variable %in% colnames(data)[c(1:23,29)])
  stat_plot <- ggplot(data = stat_data,aes(x=stat_data$variable,y=stat_data$value,fill= as.character(stat_data$id)))+
    geom_bar(stat="identity",position = "dodge")+theme(axis.text.x= element_text(angle=30, hjust=1))+
    ggtitle("Compare stats")+xlab("Stats")+ylab("Value")+labs(fill="player name and id")+
    scale_fill_discrete(labels=c(player1_label,player2_label))
  percent_data <- filter(reshape_data,reshape_data$variable %in% colnames(data)[24:29])
  percent_plot <- ggplot(data = percent_data,aes(x=percent_data$variable,y=percent_data$value,fill=as.character(percent_data$id)))+
    geom_bar(stat="identity",position = "dodge")+ggtitle("Compare stats2")+
    xlab("Stats")+ylab("Value")+labs(fill="player name and id")+
    scale_fill_discrete(labels=c(player1_label,player2_label))
  return(grid.arrange(stat_plot,percent_plot))
}
