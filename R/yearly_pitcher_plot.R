#' Yearly pitcher data plotting
#'
#' plotting yearly pitcher data
#'
#' @param data two pitcher player's merged data
#' @return A plot comparing four records(G,ERA,K,IP)
#' @importFrom ggplot2 ggplot geom_bar geom_text theme ggtitle geom_point geom_line
#' @importFrom ggplot2 element_text xlab ylab aes labs
#' @importFrom gridExtra grid.arrange
#' @importFrom rlang .data
#' @examples
#' ## internal function
#' #yearly_pitcher_plot(make_plot_data(hanhwa_batter_2018,"이용규","정근우"))

yearly_pitcher_plot <- function(data){
  g_plot <- ggplot2::ggplot(data = data,aes(x=.data$period,y=.data$g,group=.data$name,fill=.data$name))+
    ggplot2::geom_bar(stat = "identity",position = "dodge")+
    theme(axis.text.x= element_text(angle=70, hjust=1))+ggtitle("Compare games")+
    xlab("Period")+ylab("Number of games")+labs(fill="player names")
  era_plot <- ggplot(data = data,aes(x=.data$period,y=.data$era,group=.data$name,colour=.data$name))+
    geom_point()+geom_line()+theme(axis.text.x= element_text(angle=70, hjust=1))+
    ggtitle("Compare ERA")+ xlab("Period")+ylab("ERA")+labs(fill="player names")
  k_plot <- ggplot(data = data,aes(x=.data$period,y=.data$k,group=.data$name,colour=.data$name))+
    geom_point()+geom_line()+theme(axis.text.x= element_text(angle=70, hjust=1))+
    ggtitle("Compare K")+xlab("Period")+ylab("K")+labs(fill="player names")
  ip_plot <- ggplot(data = data,aes(x=.data$period,y=.data$ip,group=.data$name,colour=.data$name))+
    geom_point()+geom_line()+theme(axis.text.x= element_text(angle=70, hjust=1))+
    ggtitle("Compare INNING")+xlab("Period")+ylab("INNING")+labs(fill="player names")
  return(grid.arrange(g_plot,era_plot,k_plot,ip_plot))
}
