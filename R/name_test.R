#' Check name tag
#'
#' This function identifies whether name parameter is a team name or a player name.
#'
#' @param name KBO player name or KBO Team name
#' @return name tag
#' @examples
#' ## internal function
#' #name_test("한화")

name_test <- function(name){
  if(name %in% unique(kbodatamining::hanhwa_pitcher_2018$team))
    return("team")
  else
    return("not_team")
}
