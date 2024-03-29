% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/interpolate.R
\name{weather_interp}
\alias{weather_interp}
\alias{add_weather}
\title{Interpolate and add weather data to a dataframe}
\usage{
weather_interp(
  data,
  weather,
  cols = "all",
  interval = "hour",
  na_gap = 2,
  quiet = FALSE
)
}
\arguments{
\item{data}{Dataframe. Data with dates or times to which weather data should
be added.}

\item{weather}{Dataframe. Weather data downloaded with \code{\link{weather}}
which should be interpolated and added to \code{data}.}

\item{cols}{Character. Vector containing the weather columns to add or 'all'
for all relevant columns. Note that some measure are omitted because they
cannot be linearly interpolated (e.g., wind direction).}

\item{interval}{What interval is the weather data recorded at? "hour" or
"day".}

\item{na_gap}{How many hours or days (depending on the interval) is it
acceptable to skip over when interpolating over NAs (see details).}

\item{quiet}{Logical. Suppress all messages (including messages regarding
missing data, etc.)}
}
\description{
When data and the weather measurements do not perfectly line up, perform a
linear interpolation between two weather measurements and merge the results
into the provided dataset. Only applies to numerical weather columns (see
\code{weather} for more details).
}
\details{
\strong{Dealing with NA values} If there are NAs in the weather data,
\code{na_gap} can be used to specify a tolerance. For example, a tolerance of
2 with an interval of "hour", means that a two hour gap in data can be
interpolated over (i.e. if you have data for 9AM and 11AM, but not 10AM, the
data between 9AM and 11AM will be interpolated. If, however, you have 9AM and
12PM, but not 10AM or 11AM, no interpolation will happen and data between 9AM
and 12PM will be returned as NA.)
}
\examples{
\dontshow{if (check_eccc()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}

# Weather data only
head(kamloops)

# Data about finch observations at RFID feeders in Kamloops, BC
head(finches)

# Match weather to finches
finch_weather <- weather_interp(data = finches, weather = kamloops)
\dontshow{\}) # examplesIf}
}
