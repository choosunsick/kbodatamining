#' 2018 season hanhwa batters data
#'
#' This data includes Hanhwa's and the opponent's batter record of 2018.
#'
#' @format A data frame with 3580 rows and 23 variables:
#' \describe{
#' \item{one}{one, 1 inning}
#' \item{two}{two, 2 inning}
#' \item{three}{three, 3 inning}
#' \item{four}{four, 4 inning}
#' \item{five}{five, 5 inning}
#' \item{six}{six, 6 inning}
#' \item{seven}{seven, 7 inning}
#' \item{eight}{eight, 8 inning}
#' \item{nine}{nine, 9 inning}
#' \item{ten}{ten, 10 inning}
#' \item{eleven}{eleven, 11 inning}
#' \item{twelve}{twelve, 12 inning}
#' \item{name}{name, PlayerNAME}
#' \item{r}{r, Runs Scored}
#' \item{h}{h, Hit}
#' \item{ab}{ab, AB: At Bat}
#' \item{rbi}{rbi, Run Batted In}
#' \item{team}{team, Player team}
#' \item{position}{position, Batter Position}
#' \item{date}{date, Game Date}
#' \item{away}{away, Awayteam}
#' \item{home}{home, Awayteam}
#' \item{doubleheader}{doubleheader, Whether it is a double-header game or not}
#' \item{id}{id, Player id}
#'  }
#' @source \url{https://github.com/LOPES-HUFS/KBO_Data_Wrangling}
"hanhwa_batter_2018"

#' 2018 season hanhwa pitchers data
#'
#' This data includes Hanhwa's and the opponent's pitcher record of 2018.
#'
#' @format A data frame with 3580 rows and 21 variables:
#' \describe{
#' \item{date}{date, Game Date}
#' \item{away}{away, Awayteam}
#' \item{home}{home, Awayteam}
#' \item{doubleheader}{doubleheader, Whether it is a double-header game or not}
#' \item{name}{name, PlayerNAME}
#' \item{team}{team, Player team}
#' \item{position}{position, Pitcher Position}
#' \item{mound}{mound, Information on innings and batter numbers when a pitcher plays}
#' \item{win}{win, Whether or not it was a winning pitcher}
#' \item{lose}{lose, Whether or not it was a losing pitcher}
#' \item{draw}{draw, If the pitcher has a draw}
#' \item{hld}{hld, Hold record}
#' \item{sv}{sv, Save record}
#' \item{inning}{inning, Throw more than one inning}
#' \item{restinning}{restinning, Throw less than one inning}
#' \item{r}{r, The pitcher's run}
#' \item{er}{er, The pitcher's earned run.}
#' \item{k}{k, Pitcher's strikeout number}
#' \item{bb}{bb, Number of base on balls and number of hit by pitch}
#' \item{pit}{pit, Pitches thrown}
#' \item{h}{h, Hits allowed}
#' \item{hr}{hr, Home runs allowed}
#' \item{ab}{ab, AB: At Bat}
#' \item{tbf}{tbf, TBF:Total Batters Faced}
#' \item{id}{id, Player id}
#' }
#' @source \url{https://github.com/LOPES-HUFS/KBO_Data_Wrangling}
"hanhwa_pitcher_2018"
