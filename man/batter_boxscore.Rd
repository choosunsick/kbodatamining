% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/batter_boxscore.R
\name{batter_boxscore}
\alias{batter_boxscore}
\title{The box score of the batter}
\usage{
batter_boxscore(data = kbodatamining::hanhwa_batter_2018, name,
  id = NULL, yearly = NULL, monthly = NULL)
}
\arguments{
\item{data}{'Hanhwa_batter_2018' is default data. You can put another kbo batter data if you want.}

\item{name}{The name of the batter you want}

\item{id}{This is not a required parameter. The ID parameter is a numeric type.}

\item{yearly}{The default value is NULL. Possible value is a specific year.}

\item{monthly}{The default value is NULL. Possible value is a specific month. The monthly parameter is a string type.}
}
\value{
The batter box score of the year or month put in is created.
}
\description{
This function creates annual or periodical box score of the batter.
This function has options called 'yearly' or 'monthly'.
default: The player's annual box score is created.
If you put a year in the yearly parameter, it calculates the box score of corresponding year.
If you put a month in the monthly parameter, it calculates the corresponding 'monthly' box score of every year.
If you put a year and a month in each parameters, the box score of corresponding month you put in is created.
If you are looking for a player who has the same name with other players, you need to find the player's ID and put it in the 'ID' parameter.
}
\examples{
## Example default: id=NULL, yearly=NULL, monthly=NULL
batter_boxscore(data=hanhwa_batter_2018,name="이용규")
## id=NULL, yearly=2018, monthly=NULL
batter_boxscore(data=hanhwa_batter_2018,name="이용규",yearly=2018)
## id=NULL, yearly=NULL, monthly="05"
batter_boxscore(data=hanhwa_batter_2018,name="이용규",monthly="05")
## id=NULL, yearly=2018, monthly="05"
batter_boxscore(data=hanhwa_batter_2018,name="이용규",id=NULL,yearly=2018,monthly="05")
}
