#' Make Batter statistic
#'
#' Function: Make Batter's statistic From the KBO batter data
#'
#' @param data KBO Batter data
#' @return Statistics of Batter
#' @examples
#' ## internal function:
#' ## This function creates statistical data for the batter's boxscore.
#' #batter_statistics(find_player(hanhwa_batter_2018,"이용규",NULL))

batter_statistics <- function(data){
  team <- unique(data$team)
  g <- NROW(unique(data$date))+NROW(unique(data$date[data$doubleheader!=0]))
  team <- ifelse(NROW(team)==1,team,ifelse(NROW(team)>=2,paste(team[1],",",team[2],sep = ""),"NO game participation"))
  away <- NROW(unique(data$date[data$away==team]))
  home <- NROW(unique(data$date[data$home==team]))
  pa <- pa_formula(data)
  ab <- sum(data$ab)
  h <- sum(data$h)
  r <- sum(data$r)
  rbi <- sum(data$rbi)
  one_base <- factor_count(data,"10")
  two_base <- factor_count(data,"11")
  three_base <- factor_count(data,"12")
  hr <- factor_count(data,"13")
  tb <- 1*one_base+2*two_base+3*three_base+4*hr
  bb <- factor_count(data,"30")+factor_count(data,"32")
  hbp <- factor_count(data,"31")
  ibb <- factor_count(data,"32")
  so <- factor_count(data,"20")+factor_count(data,"21")
  gidp <- factor_count(data,"72")
  sh <- factor_count(data,"41")+factor_count(data,"61")
  sf <- factor_count(data,"50")
  avg <- round(avg_formula(data),3)
  obp <- round(obp_formula(data),3)
  slg <- round(slg_formula(data),3)
  ops <- obp+slg
  babip <- ifelse(ab+sh-so-hr>0,(h-hr)/(ab+sh-so-hr),0)
  babip <- round(babip,3)
  batterstatics <- data.frame(team,g,away,home,pa,ab,h,r,rbi,one_base,two_base,three_base,hr,
             tb,bb,hbp,ibb,so,gidp,sh,sf,avg,obp,slg,ops,babip)
  return(batterstatics)
}
