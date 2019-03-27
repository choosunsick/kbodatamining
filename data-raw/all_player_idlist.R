path <-"./player_id_list/all_player_list.csv"
all_player_idlist <- read.csv(path,stringsAsFactors = F,encoding = "UTF-8")
all_player_idlist <- all_player_idlist[,2:6]
write.csv(all_player_idlist,"data-raw/all_player_idlist.csv")
usethis::use_data(all_player_idlist,overwrite = TRUE)
