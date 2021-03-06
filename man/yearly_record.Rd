% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/yearly_record.R
\name{yearly_record}
\alias{yearly_record}
\title{Yearly record}
\usage{
yearly_record(data, name, id, recordname)
}
\arguments{
\item{data}{KBO datas with at least one year of data}

\item{name}{The name of the player or the team you want}

\item{id}{The id of the player you want}

\item{recordname}{The name of the record you want}
}
\value{
The yearly record of the player or team
}
\description{
This function shows the yearly record of the player or team
}
\examples{
## internal function - not run
#yearly_record(hanhwa_batter_2018,"이용규",avg_formula)
#yearly_record(hanhwa_batter_2018,"한화",avg_formula)
}
