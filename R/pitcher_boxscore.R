#' The box score of the pitcher player
#'
#' This function creates a box score for the pitcher for the year or period.
#' This function has an option for yearly and monthly.
#' default: The player's annual box score is created.
#' If you put a year in the yearly parameter, it calculates the corresponding year box score.
#' If you put a month in the monthly parameter, it calculates the corresponding yearly-month box score.
#' If you put a year and a month in two parameters, the box score for the specific time you put in is created.
#' @param data Default data is hanhwa_pitcher_2018 You can put other KBO pitcher data if you want.
#' @param name The name of the pitcher you want
#' @param yearly The default value is NULL Possible values are a specific year.
#' @param monthly The default value is NULL Possible values are a specific month.
#' @return The box score for the year, month, or period put in is created.
#' @examples
#' ## default: yearly=NULL,monthly=NULL
#' pitcher_boxscore(hanhwa_pitcher_2018,"정우람")
#' ## yearly=2018, monthly=NULL
#' pitcher_boxscore(hanhwa_pitcher_2018,"정우람",yearly=2018)
#' ## yearly=NULL, monthly="05"
#' pitcher_boxscore(hanhwa_pitcher_2018,"정우람",monthly="05")
#' ## yearly=2018, monthly="05"
#' pitcher_boxscore(hanhwa_pitcher_2018,"정우람",yearly=2018,monthly="05")
#' @export
#완봉 관련해서 전체 데이터가 들어갔을 때도 적용되겠금 만들어야함
#봐서 중간 부분 함수로 빼던가 해야함
#팀일 때 선수일때 구분해서 완봉 기록 매칭해주는 거 만들어야함
pitcher_boxscore <- function(data=kbodatamining::hanhwa_pitcher_2018,name,yearly=NULL,monthly=NULL){
  boxscore <- date_test(data,name,yearly,monthly,pitcher_statistics)
  cg_list <- bind_cg_list(data,boxscore$record.team)
  cgs_list <- bind_cgs_list(data,boxscore$record.team)
  boxscore <- boxscore_test(name,boxscore,cg_list,cgs_list)
  return(boxscore)
}
