library(jsonlite)
sample_set <- fromJSON("./json_sample/Hanhwa_normalseason_2018.json")

hanhwa_batter_2018 <- do.call(rbind,lapply(names(sample_set),FUN = function(x)json2batterdf(sample_set,x)))
hanhwa_batter_2018 <- hanhwa_batter_2018[,c(18:21,11,16:17,1:9,24,23,22,13,12,10,15)]
colnames(hanhwa_batter_2018) <- c('date','away','home','doubleheader','name','team','position',
                                  'one','two','three','four','five','six','seven','eight','nine',
                                  'ten','eleven','twelve','ab','h','r','rbi')
write.csv(hanhwa_batter_2018,"data-raw/hanhwa_batter_2018.csv",row.names = F)
usethis::use_data(hanhwa_batter_2018,overwrite = TRUE)
