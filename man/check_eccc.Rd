% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{check_eccc}
\alias{check_eccc}
\title{Check access to ECCC}
\usage{
check_eccc()
}
\value{
FALSE if not, TRUE if so
}
\description{
Checks if whether there is internet access, weather data, normals data,
and eccc sites are available and accessible, and whether we're NOT running
on cran
}
\examples{

check_eccc()

}
