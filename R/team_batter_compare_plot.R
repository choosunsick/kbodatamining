#' Compares the hits of two teams
#'
#' A plotting function that compares the hits of two teams
#'
#' @param data two teams of batter's merged data
#' @return A plot comparing records(AVG,OBP,SLG,BABIP)
#' @importFrom ggplot2 ggplot geom_segment scale_x_continuous ggtitle scale_colour_manual aes geom_point
#' @importFrom ggplot2 xlab ylab
#' @importFrom gridExtra grid.arrange
#' @importFrom rlang .data
#' @examples
#' ## internal function
#' #team_batter_compare_plot(make_all_batter_data(KBO_full_data,"한화","LG",2018,NULL))
team_batter_compare_plot <- function(data){
  temp <-data[data$g>=10,]
  avg_compare <- ggplot(temp,aes(.data$avg,.data$name))+geom_segment(aes(yend = .data$name), xend = 0, color = "grey50")+
    geom_point(size = 3, aes(color = .data$team))+scale_x_continuous(breaks = seq(0,0.4,0.05))+
    scale_colour_manual(values=c("blue", "red"))+ggtitle("Compare AVG")+xlab("AVG")+ylab("PlayerName")
  obp_compare <- ggplot(temp,aes(.data$obp,.data$name))+geom_segment(aes(yend = .data$name), xend = 0, color = "grey50")+
    geom_point(size = 3, aes(color = .data$team))+scale_x_continuous(breaks = seq(0,0.5,0.1))+
    scale_colour_manual(values=c("blue", "red"))+ggtitle("Compare OBP")+xlab("OBP")+ylab("PlayerName")
  slg_compare <- ggplot(temp,aes(.data$slg,.data$name))+geom_segment(aes(yend = .data$name), xend = 0, color = "grey50")+
    geom_point(size = 3, aes(color = .data$team))+scale_x_continuous(breaks = seq(0,0.7,0.15))+
    scale_colour_manual(values=c("blue", "red"))+ggtitle("Compare SLG")+xlab("SLG")+ylab("PlayerName")
  babip_compare <- ggplot(temp,aes(.data$babip,.data$name))+geom_segment(aes(yend = .data$name), xend = 0, color = "grey50")+
    geom_point(size = 3, aes(color = .data$team))+scale_x_continuous(breaks = seq(0,0.7,0.15))+
    scale_colour_manual(values=c("blue", "red"))+ggtitle("Compare BABIP")+xlab("BABIP")+ylab("PlayerName")
  return(grid.arrange(avg_compare,obp_compare,slg_compare,babip_compare))
}
