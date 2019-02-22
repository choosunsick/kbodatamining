#' Make Batter statistic
#'
#' Function: Make Batter's statistic From the KBO data
#'
#' @param data KBO batter record data
#' @return Batter's statistic
#' @examples
#' ## internal function
#' #batter_statistics(find_player(hanhwa_batter_2018,"이용규"))

batter_statistics <- function(data){
  team <- unique(data$team)
  g <- NROW(unique(data$date))+NROW(unique(data$date[data$doubleheader!=0]))
  team <- ifelse(NROW(team)==1,team,ifelse(NROW(team)>2,paste(team[1],team[2],sep = ""),"NO game participation"))
  pa <- pa_formula(data)
  ab <- sum(data$ab)
  h <- sum(data$h)
  r <- sum(data$r)
  rbi <- sum(data$rbi)
  one_base <- onebase_formula(data)
  two_base <- twobase_formula(data)
  three_base <- threebase_formula(data)
  hr <- homerun_formula(data)
  tb <- 1*one_base+2*two_base+3*three_base+4*hr
  bb <- bb_formula(data)
  hbp <- hbp_formula(data)
  ibb <- ibb_formula(data)
  so <- so_formula(data)
  gidp <- gidp_formula(data)
  sh <- sh_formula(data)
  sf <- sf_formula(data)
  avg <- avg_formula(data)
  obp <- obp_formula(data)
  slg <- slg_formula(data)
  ops <- obp+slg
  babip <- ifelse(ab+sh-so-hr>0,(h-hr)/(ab+sh-so-hr),0)
  batterstatics <- data.frame(team,g,pa,ab,h,r,rbi,one_base,two_base,three_base,hr,
             tb,bb,hbp,ibb,so,gidp,sh,sf,avg,obp,slg,ops,babip)
  return(batterstatics)
}
