#' Annual hit record plot
#'
#' Compare the four records of the two players in the data.
#' This function requires data that has a duration of at least two seasons.
#'
#' @param data You can use the `make_batter_data_4plot()` function to create  merged two batters data.
#' @return Four plot comparing four records(G,AVG,OPS,BABIP) of each player
#' @importFrom ggplot2 ggplot geom_bar geom_text theme ggtitle geom_point geom_line
#' @importFrom ggplot2 element_text xlab ylab aes labs scale_y_continuous geom_text
#' @importFrom gridExtra grid.arrange
#' @importFrom rlang .data
#' @examples
#' ## internal function
#' #yearly_batter_plot(make_batter_data_4plot(Yearly_KBO_DATA,"이용규","정근우"))

yearly_batter_plot <- function(data){
  if(NROW(unique(substr(data$date,1,4)))==1){
    stop("It is not an annual data source and Use more than two years of KBO batter data.")
  }
  data$avg <- round(data$avg,2)
  data$ops <- round(data$ops,2)
  data$babip <- round(data$babip,2)
  g_plot <- ggplot2::ggplot(data = data,aes(x=.data$period,y=.data$g,group=.data$name,fill=.data$name))+
    ggplot2::geom_bar(stat = "identity",position = "dodge")+
    theme(axis.text.x= element_text(angle=70, hjust=1))+ggtitle("Compare games")+
    xlab("Period")+ylab("Number of games")+labs(fill="player names")+scale_y_continuous(breaks = seq(0,150,25))
  avg_plot <- ggplot(data = data,aes(x=.data$period,y=.data$avg,group=.data$name,colour=.data$name))+
    geom_point()+geom_line()+theme(axis.text.x= element_text(angle=70, hjust=1))+
    ggtitle("Compare AVG")+ xlab("Period")+ylab("AVG")+labs(colour="player names")+
    geom_text(aes(y=.data$avg-0.005,label=.data$avg),size=3)
  ops_plot <- ggplot(data = data,aes(x=.data$period,y=.data$ops,group=.data$name,colour=.data$name))+
    geom_point()+geom_line()+theme(axis.text.x= element_text(angle=70, hjust=1))+
    ggtitle("Compare OPS")+xlab("Period")+ylab("OPS")+labs(colour="player names")+
    geom_text(aes(y=.data$ops-0.005,label=.data$ops),size=3)
  babip_plot <- ggplot(data = data,aes(x=.data$period,y=.data$babip,group=.data$name,colour=.data$name))+
    geom_point()+geom_line()+theme(axis.text.x= element_text(angle=70, hjust=1))+
    ggtitle("Compare BABIP")+xlab("Period")+ylab("BABIP")+labs(colour="player names")+
    geom_text(aes(y=.data$babip-0.005,label=.data$babip),size=3)
  return(grid.arrange(g_plot,avg_plot,ops_plot,babip_plot))
}
