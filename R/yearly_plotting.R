#' Yearly data plotting
#'
#' plotting yearly batter data
#'
#' @param data two batter player's merged data
#' @return A plot comparing four records(G,AVG,OPS,BABIP)
#' @importFrom ggplot2 ggplot geom_bar geom_text theme ggtitle geom_point geom_line
#' @importFrom ggplot2 element_text xlab ylab aes
#' @importFrom gridExtra grid.arrange
#' @importFrom rlang .data
#' @examples
#' ## internal function
#' #yearly_plotting(make_plot_data(hanhwa_batter_2018,"이용규","정근우"))
#xlab,ylab 이름 변경해야함
yearly_plotting <- function(data){
  g_plot <- ggplot2::ggplot(data = data,aes(x=.data$period,y=.data$g,group=.data$name,fill=.data$name))+
    ggplot2::geom_bar(stat = "identity",position = "dodge")+
    theme(axis.text.x= element_text(angle=70, hjust=1))+ggtitle("Compare games")+
    xlab("Period")+ylab("Number of games")
  avg_plot <- ggplot(data = data,aes(x=.data$period,y=.data$avg,group=.data$name,colour=.data$name))+
    geom_point()+geom_line()+theme(axis.text.x= element_text(angle=70, hjust=1))+
    ggtitle("Compare AVG")+ xlab("Period")+ylab("AVG")
  ops_plot <- ggplot(data = data,aes(x=.data$period,y=.data$ops,group=.data$name,colour=.data$name))+
    geom_point()+geom_line()+theme(axis.text.x= element_text(angle=70, hjust=1))+
    ggtitle("Compare OPS")+xlab("Period")+ylab("OPS")
  babip_plot <- ggplot(data = data,aes(x=.data$period,y=.data$babip,group=.data$name,colour=.data$name))+
    geom_point()+geom_line()+theme(axis.text.x= element_text(angle=70, hjust=1))+
    ggtitle("Compare BABIP")+xlab("Period")+ylab("BABIP")
  return(grid.arrange(g_plot,avg_plot,ops_plot,babip_plot))
}
