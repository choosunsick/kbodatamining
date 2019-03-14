library(jsonlite)
sample_set <- fromJSON("./json_sample/Hanhwa_normalseason_2018.json")
pitcher_id  <- read.csv("./player_id_list/pitcher_id_list.csv",stringsAsFactors = F)

hanhwa_pitcher_2018 <- do.call(rbind,lapply(names(sample_set),FUN = function(x)json2pitcherdf(sample_set,x)))
hanhwa_pitcher_2018 <- hanhwa_pitcher_2018[,c(1,5:7,2,8,3,4,9,10:15,18:19,17,16,20:24)]
colnames(hanhwa_pitcher_2018) <- c('date','away','home','doubleheader','name','team','position','mound','win','lose',
                                   'draw','hld','sv','inning','restinning','r','er','k','bb','pit','h','hr','ab','tbf')

pitcher_id_2018 <- pitcher_id[substr(pitcher_id$date,1,4)==2018,]
pitcher_id_hanhwa_2018 <- pitcher_id_2018[pitcher_id_2018$away=="한화"|pitcher_id_2018$home=="한화",]
hanhwa_pitcher_2018 <- get_player_id(hanhwa_pitcher_2018,pitcher_id_hanhwa_2018)
hanhwa_pitcher_2018 <- hanhwa_pitcher_2018[order(hanhwa_pitcher_2018$date,decreasing = F),]
write.csv(hanhwa_pitcher_2018,"data-raw/hanhwa_pitcher_2018.csv",row.names = F)

usethis::use_data(hanhwa_pitcher_2018,overwrite = TRUE)
