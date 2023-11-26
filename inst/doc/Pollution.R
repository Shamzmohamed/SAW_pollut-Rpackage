## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(SAWpollut)

## -----------------------------------------------------------------------------
pollution_data <- load_data()
data <- load_data()
print(head(pollution_data))

## -----------------------------------------------------------------------------
file <- load_data
pollutants= c("CO", "SO2", "NO2", "O3")
pollu_locs <- highpol(file, pollutants)
for (pollutant in pollutants) {
  cat("Pollutant:", pollutant, "\n")
  cat("Address:", pollu_locs[[pollutant]]$address, "\n\n")}

## ----fig.height=6,fig.width=6-------------------------------------------------
data <- load_data()
intpol(data, "PM10")

## -----------------------------------------------------------------------------
data <- load_data()
pollutants <- c("SO2", "NO2", "O3", "CO", "PM10", "PM2.5")
d2a_conv(data = data, date = "Date", pollutants = pollutants)

## ---- fig.height=6,fig.width=6------------------------------------------------
data <- load_data()
pollutants <- c("PM10", "PM2.5")
clust(data, pollutants, method = "kmeans", k = 4)

## -----------------------------------------------------------------------------
data <- load_data()
dm_plots(data, "Date", pollutants = c("SO2", "NO2", "O3", "CO", "PM10", "PM2.5"))

## ----fig.height=6,fig.width=6-------------------------------------------------
data <- load_data()
anomaldet(data, date_col = "Date", pollutant = "PM10",forecast_horizon = 24, 
                             arima_order = c(1, 1, 1), threshold = 2.5)

## -----------------------------------------------------------------------------
data <- load_data()
pollutants <- c("SO2", "NO2", "O3", "CO", "PM10", "PM2.5")
matriplot(data, pollutants)

## -----------------------------------------------------------------------------
data <- load_data()
pollutants <- c("SO2", "NO2", "O3", "CO", "PM10", "PM2.5")
seaso(data, pollutants)

## -----------------------------------------------------------------------------
data <- load_data()
pollutants <- c("SO2", "NO2", "O3", "CO", "PM10", "PM2.5")
correg(data, pollutants)

