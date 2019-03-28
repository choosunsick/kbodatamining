#' Comparing pitching stats of two teams during one season
#'
#' A plotting function that compares pitcher statistic of two teams during one season
#'
#' This function has options called 'yearly' or 'monthly'.
#' default: the yearly parameter is 2018, the monthly parameter is NULL.
#' If you put a year in the yearly parameter, you draw a hit comparison plot of the two teams for that year.
#' If you put a month in the monthly parameter, you draw a hit comparison plot of the two teams for the matched 2018 year and specific month.
#' If you put a year and a month in each parameters, you draw a hit comparison plot of the two teams for the matched specific year and month.
#' If you are using MAC and Hangeul fonts are broken, type `theme_set(theme_gray(base_family = "AppleGothic"))`
#' @param data Your data must include at least one season of KBO data.
#' @param team1 The first of the team you want to compare
#' @param team2 The second of the team you want to compare
#' @param yearly The default value is 2018. Possible values are specific year.
#' @param monthly The default value is NULL. Possible values are specific month.
#' @return Plot to compare pitching records of two teams
#' @importFrom ggplot2 xlab ylab labs theme element_text geom_bar geom_text ggtitle position_stack facet_wrap
#' @importFrom reshape2 melt
#' @examples
#' ## Note: This example shows only the operation. This example does not include all game of team2.
#' ## default: yearly=2018, monthly=NULL
#' compare_pitcher_statistic_teams(hanhwa_batter_2018,"한화","LG",yearly=2018,monthly=NULL)
#' ## yearly=2018, monthly="05"
#' compare_pitcher_statistic_teams(hanhwa_batter_2018,"한화","LG",yearly=2018,monthly="05")
#' @export

compare_pitcher_statistic_teams <- function(data,team1,team2,yearly=2018,monthly=NULL){
  team1 <- team_pitcher_boxscore(data = data,teamname = team1,yearly = yearly,monthly = monthly)
  team2 <- team_pitcher_boxscore(data = data,teamname = team2,yearly = yearly,monthly = monthly)
  data <- rbind(team1,team2)
  temp <- melt(data,id.vars = c("period", "team"))
  plot<-ggplot(temp,aes(temp$team,y = temp$value,fill=temp$team))+
    geom_bar(stat="identity",position = "dodge")+theme(axis.text.x= element_text(angle=30, hjust=1))+
    ggtitle("Compare stats")+geom_text(aes(label=temp$value),position = position_stack(vjust=0.5),angle=30)+
    xlab("Teamname")+ylab("Stat Value")+labs(fill="team")+facet_wrap(temp$variable,scales = "free")
  return(plot)
}
