#' Compares the pitching of two teams
#'
#' A plotting function that compares the pitching of two teams.
#' We compare pitchers who have played in more than three games on each team.
#'
#' @param data two teams of pitcher's merged data
#' @return A plot comparing records(ERA,K(SO),OBA,P/IP)
#' @importFrom ggplot2 ggplot geom_segment scale_x_continuous ggtitle scale_colour_manual aes geom_point
#' @importFrom ggplot2 xlab ylab theme element_text
#' @importFrom gridExtra grid.arrange
#' @importFrom rlang .data
#' @examples
#' team_pitcher_compare_plot(make_all_pitcher_data(hanhwa_pitcher_2018,"한화","LG",2018,NULL))
#' @export
team_pitcher_compare_plot <- function(data){
  temp<-data[data$g >=3,]
  era_compare <- ggplot(temp,aes(.data$era,.data$name))+geom_segment(aes(yend = .data$name), xend = 0, color = "grey50")+
    geom_point(size = 3, aes(color = .data$team))+scale_x_continuous(breaks = seq(0,50,10))+
    scale_colour_manual(values=c("blue", "red"))+ggtitle("Compare ERA")+xlab("ERA")+ylab("PlayerName")+
    theme(axis.text.y = element_text(angle = 15,hjust=0.5,vjust=0.5,size = 7))
  k_compare <- ggplot(temp,aes(.data$k,.data$name))+geom_segment(aes(yend = .data$name), xend = 0, color = "grey50")+
    geom_point(size = 3, aes(color = .data$team))+scale_x_continuous(breaks = seq(0,200,25))+
    scale_colour_manual(values=c("blue", "red"))+ggtitle("Compare K")+xlab("K")+ylab("PlayerName")+
    theme(axis.text.y = element_text(angle = 15,hjust=0.5,vjust=0.5,size = 7))
  oba_compare <- ggplot(temp,aes(.data$oba,.data$name))+geom_segment(aes(yend = .data$name), xend = 0, color = "grey50")+
    geom_point(size = 3, aes(color = .data$team))+scale_x_continuous(breaks = seq(0,0.7,0.15))+
    scale_colour_manual(values=c("blue", "red"))+ggtitle("Compare OBA")+xlab("OBA")+ylab("PlayerName")+
    theme(axis.text.y = element_text(angle = 15,hjust=0.5,vjust=0.5,size = 7))
  p_ip_compare <- ggplot(temp,aes(.data$p_ip,.data$name))+geom_segment(aes(yend = .data$name), xend = 0, color = "grey50")+
    geom_point(size = 3, aes(color = .data$team))+scale_x_continuous(breaks = seq(0,50,5))+
    scale_colour_manual(values=c("blue", "red"))+ggtitle("Compare P/IP")+xlab("P/IP")+ylab("PlayerName")+
    theme(axis.text.y = element_text(angle = 15,hjust=0.5,vjust=0.5,size = 7))
  return(grid.arrange(era_compare,k_compare,oba_compare,p_ip_compare))
}
