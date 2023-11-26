#' Daily, Monthly Time Series Plot
#'
#' This function can be used to plot time series plots for pollution data.
#' Daily, monthly, and annual values of the time series are plotted.
#'
#' @param data A data frame containing pollution data.
#' @param date Column name containing date in year-month-day format.
#' @param pollutants Vector of pollutant names for analysis.
#'
#' @return Plots of daily, monthly, and annual time series for each pollutant.
#'
#' @examples
#' data <- load_data()
#' dm_plots(data, "Date", pollutants = c("SO2", "NO2", "O3", "CO", "PM10", "PM2.5"))
#'
#' @importFrom lubridate year month
#' @export
dm_plots <- function(data, date, pollutants) {
  # Convert the date column to Date object
  data$Date <- as.Date(data[[date]], format = "%m/%d/%Y %H:%M")
  # Create daily, monthly, and annual time series
  data_daily <- aggregate(data[, pollutants], by = list(Date = trunc(data$Date)), FUN = mean)
  data_monthly <- aggregate(data[, pollutants], by = list(Year = lubridate::year(data$Date), Month = lubridate::month(data$Date)), FUN = mean)
  data_annual <- aggregate(data[, pollutants], by = list(Year = lubridate::year(data$Date)), FUN = mean)
  # Plot daily time series
  for (pollutant in pollutants) {
    plot(data_daily$Date, data_daily[[pollutant]], type = "l",
         xlab = "Date", ylab = paste(pollutant, "Concentration"),
         main = paste("Daily Time Series of", pollutant))
  }

  # Plot monthly time series
  for (pollutant in pollutants) {
    plot(data_monthly$Month, data_monthly[[pollutant]], type = "b",
         xlab = "Month", ylab = paste(pollutant, "Concentration"),
         main = paste("Monthly Time Series of", pollutant))
    points(data_monthly$Month, data_monthly[[pollutant]], pch = 16)
  }
}
