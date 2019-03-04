#' Check name tag
#'
#' This function identifies whether the name is a team name or not
#'
#' @param name KBO player name or KBO Team name
#' @return check name tag
#' @examples
#' ## internal function
#' #name_test("한화")

name_test <- function(name){
  if(name %in% unique(kbodatamining::hanhwa_pitcher_2018$team))
    return("team")
  else
    return("not_team")
}
