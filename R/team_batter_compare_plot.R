#' Comparing the hits of two teams
#'
#' A plotting function that compares the hits of two teams
#' We compare batters who have played in more than ten games on each team.
#'
#' @param data two teams of batter's merged data
#' @return A plot comparing records(AVG,OBP,SLG,BABIP)
#' @importFrom ggplot2 ggplot geom_segment scale_x_continuous ggtitle scale_colour_manual aes geom_point
#' @importFrom ggplot2 xlab ylab theme element_text
#' @importFrom gridExtra grid.arrange
#' @importFrom rlang .data
#' @examples
#' team_batter_compare_plot(make_all_batter_data(hanhwa_batter_2018,"한화","LG",2018,NULL))
#' @export
team_batter_compare_plot <- function(data){
  temp <-data[data$g>=10,]
  avg_compare <- ggplot(temp,aes(.data$avg,.data$name))+geom_segment(aes(yend = .data$name), xend = 0, color = "grey50")+
    geom_point(size = 3, aes(color = .data$team))+scale_x_continuous(breaks = seq(0,0.4,0.05))+
    scale_colour_manual(values=c("blue", "red"))+ggtitle("Compare AVG")+xlab("AVG")+ylab("PlayerName")+
    labs(colour="Team Names")+theme(axis.text.y = element_text(angle = 0,hjust=0.5,vjust=0.5,size = 7))
  obp_compare <- ggplot(temp,aes(.data$obp,.data$name))+geom_segment(aes(yend = .data$name), xend = 0, color = "grey50")+
    geom_point(size = 3, aes(color = .data$team))+scale_x_continuous(breaks = seq(0,0.5,0.1))+
    scale_colour_manual(values=c("blue", "red"))+ggtitle("Compare OBP")+xlab("OBP")+ylab("PlayerName")+
    labs(colour="Team Names")+theme(axis.text.y = element_text(angle = 0,hjust=0.5,vjust=0.5,size = 7))
  slg_compare <- ggplot(temp,aes(.data$slg,.data$name))+geom_segment(aes(yend = .data$name), xend = 0, color = "grey50")+
    geom_point(size = 3, aes(color = .data$team))+scale_x_continuous(breaks = seq(0,0.7,0.15))+
    scale_colour_manual(values=c("blue", "red"))+ggtitle("Compare SLG")+xlab("SLG")+ylab("PlayerName")+
    labs(colour="Team Names")+theme(axis.text.y = element_text(angle = 0,hjust=0.5,vjust=0.5,size = 7))
  babip_compare <- ggplot(temp,aes(.data$babip,.data$name))+geom_segment(aes(yend = .data$name), xend = 0, color = "grey50")+
    geom_point(size = 3, aes(color = .data$team))+scale_x_continuous(breaks = seq(0,0.7,0.15))+
    scale_colour_manual(values=c("blue", "red"))+ggtitle("Compare BABIP")+xlab("BABIP")+ylab("PlayerName")+
    labs(colour="Team Names")+theme(axis.text.y = element_text(angle = 0,hjust=0.5,vjust=0.5,size = 7))
  return(grid.arrange(avg_compare,obp_compare,slg_compare,babip_compare))
}
