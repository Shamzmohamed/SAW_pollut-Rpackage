% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/intpol.R
\name{intpol}
\alias{intpol}
\title{Interpolate and plot air quality measurements}
\usage{
intpol(data, param_name)
}
\arguments{
\item{data}{A data frame containing at least three columns: Longitude, Latitude, and a pollution parameter.}

\item{param_name}{The name of the pollution parameter to interpolate and plot.}

\item{lon_grid}{A vector specifying the longitude grid points for interpolation.}

\item{lat_grid}{A vector specifying the latitude grid points for interpolation.}
}
\description{
Interpolate and plot air quality measurements
}
\examples{
data <- load_data()
intpol(data, "PM10")

}
