#' Yearly batter data plotting
#'
#' plotting yearly batter data
#'
#' @param data two batter player's merged data
#' @return A plot comparing four records(G,AVG,OPS,BABIP)
#' @importFrom ggplot2 ggplot geom_bar geom_text theme ggtitle geom_point geom_line
#' @importFrom ggplot2 element_text xlab ylab aes labs
#' @importFrom gridExtra grid.arrange
#' @importFrom rlang .data
#' @examples
#' ## internal function
#' #yearly_batter_plot(make_plot_data(hanhwa_batter_2018,"이용규","정근우"))

yearly_batter_plot <- function(data){
  g_plot <- ggplot2::ggplot(data = data,aes(x=.data$period,y=.data$g,group=.data$name,fill=.data$name))+
    ggplot2::geom_bar(stat = "identity",position = "dodge")+
    theme(axis.text.x= element_text(angle=70, hjust=1))+ggtitle("Compare games")+
    xlab("Period")+ylab("Number of games")+labs(fill="player names")
  avg_plot <- ggplot(data = data,aes(x=.data$period,y=.data$avg,group=.data$name,colour=.data$name))+
    geom_point()+geom_line()+theme(axis.text.x= element_text(angle=70, hjust=1))+
    ggtitle("Compare AVG")+ xlab("Period")+ylab("AVG")+labs(fill="player names")
  ops_plot <- ggplot(data = data,aes(x=.data$period,y=.data$ops,group=.data$name,colour=.data$name))+
    geom_point()+geom_line()+theme(axis.text.x= element_text(angle=70, hjust=1))+
    ggtitle("Compare OPS")+xlab("Period")+ylab("OPS")+labs(fill="player names")
  babip_plot <- ggplot(data = data,aes(x=.data$period,y=.data$babip,group=.data$name,colour=.data$name))+
    geom_point()+geom_line()+theme(axis.text.x= element_text(angle=70, hjust=1))+
    ggtitle("Compare BABIP")+xlab("Period")+ylab("BABIP")+labs(fill="player names")
  return(grid.arrange(g_plot,avg_plot,ops_plot,babip_plot))
}
