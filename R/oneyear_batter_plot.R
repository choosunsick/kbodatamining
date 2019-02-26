#' Year batter data plotting
#'
#' plotting one season batter data to compare
#'
#' @param data two batter player's merged data
#' @return A plot comparing records
#' @importFrom ggplot2 ggplot geom_bar theme ggtitle xlab ylab aes labs
#' @importFrom gridExtra grid.arrange
#' @importFrom rlang .data
#' @importFrom reshape2 melt
#' @importFrom dplyr filter
#' @examples
#' ## internal function
#' #oneyear_batter_plot(make_plot_data(hanhwa_batter_2018,"이용규","정근우"))

oneyear_batter_plot <- function(data){
  stat_data <- filter(melt(data,1:3),.data$variable %in% colnames(data)[1:23])
  stat_plot <- ggplot(data = stat_data,aes(x=.data$variable,y=.data$value,fill=.data$name))+
    geom_bar(stat="identity",position = "dodge")+theme(axis.text.x= element_text(angle=30, hjust=1))+
    ggtitle("Compare stats")+xlab("Stats")+ylab("Value")+labs(fill="player names")
  percent_data <- filter(melt(data,1:3),.data$variable %in% colnames(data)[24:28])
  stat_plot2 <- ggplot(data = percent_data,aes(x=.data$variable,y=.data$value,fill=.data$name))+
    geom_bar(stat="identity",position = "dodge")+ggtitle("Compare stats2")+
    xlab("Stats")+ylab("Value")+labs(fill="player names")
  return(grid.arrange(stat_plot,stat_plot2))
}
