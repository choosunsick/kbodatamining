#' Compares the hits of two teams
#'
#' A plotting function that compares the hits of two teams
#'
#' @param data two teams of batter's merged data
#' @return A plot comparing records(ERA,K(SO),OBA,P/IP)
#' @importFrom ggplot2 ggplot geom_segment scale_x_continuous ggtitle scale_colour_manual aes geom_point
#' @importFrom gridExtra grid.arrange
#' @importFrom rlang .data
#' @examples
#' ## internal function
#' #team_pitcher_compare_plot(make_all_pitcher_data(KBO_full_data,"한화","LG",2018,NULL))
team_pitcher_compare_plot <- function(data){
  temp<-data[data$g >=3,]
  era_compare <- ggplot(temp,aes(.data$era,.data$name))+geom_segment(aes(yend = .data$name), xend = 0, color = "grey50")+
    geom_point(size = 3, aes(color = .data$team))+scale_x_continuous(breaks = seq(0,50,10))+
    scale_colour_manual(values=c("blue", "red"))+ggtitle("Compare ERA")
  k_compare <- ggplot(temp,aes(.data$k,.data$name))+geom_segment(aes(yend = .data$name), xend = 0, color = "grey50")+
    geom_point(size = 3, aes(color = .data$team))+scale_x_continuous(breaks = seq(0,200,25))+
    scale_colour_manual(values=c("blue", "red"))+ggtitle("Compare K")
  oba_compare <- ggplot(temp,aes(.data$oba,.data$name))+geom_segment(aes(yend = .data$name), xend = 0, color = "grey50")+
    geom_point(size = 3, aes(color = .data$team))+scale_x_continuous(breaks = seq(0,0.7,0.15))+
    scale_colour_manual(values=c("blue", "red"))+ggtitle("Compare OBA")
  p_ip_compare <- ggplot(temp,aes(.data$p_ip,.data$name))+geom_segment(aes(yend = .data$name), xend = 0, color = "grey50")+
    geom_point(size = 3, aes(color = .data$team))+scale_x_continuous(breaks = seq(0,50,5))+
    scale_colour_manual(values=c("blue", "red"))+ggtitle("Compare P/IP")
  return(grid.arrange(era_compare,k_compare,oba_compare,p_ip_compare))
}
