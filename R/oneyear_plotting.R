#' Year data plotting
#'
#' plotting year batter data
#'
#' @param data two batter player's merged data
#' @return A plot comparing four records
#' @importFrom ggplot2 ggplot geom_bar theme ggtitle xlab ylab aes
#' @importFrom gridExtra grid.arrange
#' @importFrom rlang .data
#' @importFrom reshape2 melt
#' @importFrom dplyr filter
#' @examples
#' ## internal function
#' #oneyear_plotting(make_plot_data(hanhwa_batter_2018,"이용규","정근우"))

oneyear_plotting <- function(data){
  stat_data <- filter(melt(data,1:3),.data$variable %in% colnames(data)[1:21])
  stat_plot <- ggplot(data = stat_data,aes(x=.data$variable,y=.data$value,fill=.data$name))+
    geom_bar(stat="identity",position = "dodge")+ ggtitle("Compare stats")+
    xlab("Stats")+ylab("Value")
  percent_data <- filter(melt(data,1:3),.data$variable %in% colnames(data)[22:25])
  stat_plot2 <- ggplot(data = percent_data,aes(x=.data$variable,y=.data$value,fill=.data$name))+
    geom_bar(stat="identity",position = "dodge")+ggtitle("Compare stats2")+
    xlab("Stats")+ylab("Value")
  return(grid.arrange(stat_plot,stat_plot2))
}
