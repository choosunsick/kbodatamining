% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/year_month_record.R
\name{year_month_record}
\alias{year_month_record}
\title{Record of player or team by period}
\usage{
year_month_record(data, name, id, recordname, year, month)
}
\arguments{
\item{data}{KBO datas with at least one year of data}

\item{name}{The name of the player or the team you want}

\item{id}{The id of the player you want}

\item{recordname}{The name of the record you want}

\item{year}{Possible value is a specific year.}

\item{month}{Possible value is a specific month.}
}
\value{
The record of the player or team during the period you put
}
\description{
This function shows the baseball record of the player or team of the year and month you put in
}
\examples{
## internal function - not run
# year_month_record(hanhwa_batter_2018,"이용규",avg_formula,2018,"05")
# year_month_record(hanhwa_batter_2018,"한화",avg_formula,2018,"05")
}
