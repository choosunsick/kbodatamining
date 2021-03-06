% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/jsondata2pitcherdf.R
\name{json2pitcherdf}
\alias{json2pitcherdf}
\title{json file to pitcher dataframe}
\usage{
json2pitcherdf(jsondata, gameid)
}
\arguments{
\item{jsondata}{KBO data json file}

\item{gameid}{KBO game date and versus infomation}
}
\value{
the pitcher dataframe data that is changed from json data file
}
\description{
This function changes pitcher data in json file to dataframe data
}
\details{
## You can read the json file in the json_sample folder and use it.
## You can use the fromJSON function of the jsonlite package to read the json file.
## You can also get the KBO full game json file.
## You can extract it from the "https://github.com/LOPES-HUFS/KBO_Data_Wrangling" project
## And working the code in the notebook file.
## If you get a json file through one of the above methods,
## you can open it and use it as an paremeter to the function.
## The gameid paremeter can be obtained using the default function names.
}
\examples{
## not run
## This example does not run the example because it requires a json file.
# jsondata <- jsonlite::fromJSON(./json_sample/Hanhwa_normalseason_2018.json)
# json2pitcherdf(jsondata,names(jsondata)[1])
}
