#' Col sum function
#'
#' Select and sum one of the columns in the data
#'
#' @param data KBO data
#' @param col Selected col name
#' @return Sum of selected columns
#' @examples
#' sum_col(hanhwa_pitcher_2018,"er")
#' @export

sum_col <- function(data,col){
  sum_data <- sum(data[col])
  return(sum_data)
}
