#' Make Pitcher statistic
#'
#' Function: Make Pitcher's statistic From the KBO Pitcher data
#'
#' @param data KBO Pitcher data
#' @return Statistics of Pitcher
#' @examples
#' ## internal function:This function creates statistical data for the pitcher's boxscore.
#' #pitcher_statistics(find_player(hanhwa_pitcher_2018,"정우람",NULL))

pitcher_statistics <- function(data){
  team <- unique(data$team)
  team <- ifelse(NROW(team)==1,team,ifelse(NROW(team)>=2,paste(team[1],",",team[2],sep = ""),"NO game participation"))
  g <- NROW(unique(data$date))+NROW(unique(data$date[data$doubleheader!=0]))
  away <- NROW(unique(data$date[data$away==team]))
  home <- NROW(unique(data$date[data$home==team]))
  win <- sum(data$win)
  lose <- sum(data$lose)
  draw <- sum(data$draw)
  wpct <- wpct_formula(data)
  hld <- sum(data$hld)
  sv <- sum(data$sv)
  ip <- sum(data$inning, data$restinning/3)
  r <- sum(data$r)
  er <- sum(data$er)
  k <- sum(data$k)
  bb_plus_hbp <- sum(data$bb)
  pit <- sum(data$pit)
  tbf <- sum(data$tbf)
  ha <- sum(data$h)
  hra <- sum(data$hr,na.rm = TRUE)
  era <- era_formula(data)
  p_ip <- p_ip_formula(data)
  k_9 <- k_9_formula(data)
  hr_9 <- hr_9_formula(data)
  oba <- ifelse(sum(data$ab)>0,round(sum(data$h)/sum(data$ab),3),0)
  pitcherstatistic <- data.frame(team,g,away,home,win,lose,draw,wpct,hld,sv,ip,r,er,k,
                                 bb_plus_hbp,pit,tbf,ha,hra,era,p_ip,k_9,hr_9,oba)
  return(pitcherstatistic)
}
