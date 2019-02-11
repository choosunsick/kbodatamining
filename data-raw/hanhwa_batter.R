library(jsonlite)
sample_set <- jsonlite::fromJSON("https://raw.githubusercontent.com/LOPES-HUFS/KBO_Data_Wrangling/master/sample/hanhwa_normalseason_2018.json")

json2batterdf <- function(jsondata,gameid){
  merge_team <- rbind.data.frame(jsondata[[gameid]]$away_batter,jsondata[[gameid]]$home_batter)
  if (NCOL(merge_team)==23){
    merge_team$`12` <- 0
  }
  else if (NCOL(merge_team)==22){
    merge_team$`12` <- 0
    merge_team$`11` <- 0
  }
  else if (NCOL(merge_team)==21){
    merge_team$`12` <- 0
    merge_team$`11` <- 0
    merge_team$`10` <- 0
  }
  else if (NCOL(merge_team)==20){
    merge_team$`12` <- 0
    merge_team$`11` <- 0
    merge_team$`10` <- 0
    merge_team$`9` <- 0
  }
  else if (NCOL(merge_team)==19){
    merge_team$`12` <- 0
    merge_team$`11` <- 0
    merge_team$`10` <- 0
    merge_team$`9` <- 0
    merge_team$`8` <- 0
  }
  else if (NCOL(merge_team)==18){
    merge_team$`12` <- 0
    merge_team$`11` <- 0
    merge_team$`10` <- 0
    merge_team$`9` <- 0
    merge_team$`8` <- 0
    merge_team$`7` <- 0
  }
  else if (NCOL(merge_team)==17){
    merge_team$`12` <- 0
    merge_team$`11` <- 0
    merge_team$`10` <- 0
    merge_team$`9` <- 0
    merge_team$`8` <- 0
    merge_team$`7` <- 0
    merge_team$`6` <- 0
  }
  else{
    print("pass")
  }
  return(merge_team)
}
hanhwa_batter <- do.call(rbind,lapply(names(sample_set),FUN = function(x)json2batterdf(sample_set,x)))
write.csv(hanhwa_batter,"data-raw/hanhwa_batter_2018.csv")
usethis::use_data(hanhwa_batter,overwrite = TRUE)
