#' Check samename
#'
#' This function checks whether the name is the same or not.
#'
#' @param name KBO player name
#' @return check of samename
#' @examples
#' ## internal function
#' name_test("이병규")
#' @export

name_test <- function(name){
  if(NROW(find_player_id(name))>1)
    return("samename")
  else
    return("not_samename")
}
