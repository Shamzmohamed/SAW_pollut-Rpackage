#' Anomaly Detection for Pollutant Concentrations
#'
#' This function detects anomalies in pollutant concentrations using the ARIMA method.
#'
#' @param data A data frame containing the pollutant data.
#' @param date_col The name of the column containing the date and time information.
#' @param pollutant The name of the pollutant column.
#' @param forecast_horizon The forecast horizon.
#' @param arima_order The ARIMA order (p, d, q) for modeling.
#' @param threshold The anomaly detection threshold.
#' @return A list containing anomaly results and a time series plot with anomalies highlighted.
#' @details
#' The function takes a data frame with pollutant data and detects anomalies using the ARIMA model.
#' It calculates the residuals between the actual and forecasted values and identifies anomalies
#' based on the provided threshold. Anomalies are marked in the plot with red points.
#'
#' @examples
#' data <- load_data()
#' anomaldet(data, date_col = "Date", pollutant = "PM10",
#' forecast_horizon = 24, arima_order = c(1, 1, 1), threshold = 2.5)
#'
#' @importFrom stats arima
#' @importFrom graphics plot lines points legend
#' @export
anomaldet <- function(data, date_col, pollutant, forecast_horizon = 24, arima_order = c(1, 1, 1), threshold = 2.5) {
  ts_data <- ts(data[[pollutant]], frequency = 24)
  if (arima_order[2] > 0) {
    ts_data <- diff(ts_data, lag = arima_order[2])}
  arima_model <- stats::arima(ts_data, order = arima_order)
  forecast_results <- predict(arima_model, n.ahead = forecast_horizon)
  # Convert the date and time column to POSIXct format
  data$date_time <- as.POSIXct(data[[date_col]], format = "%m/%d/%Y %H:%M")
  residuals <- ts_data - arima_model$residuals
  anomaly_indices <- which(abs(residuals) > threshold * sd(arima_model$residuals))
  # Plot the time series data with anomalies highlighted
  plot(data$date_time, data[[pollutant]], type = "l", xlab = "Date and Time", ylab = pollutant, main = "Time Series and Anomaly Detection")
  lines(forecast_results$pred, col = "blue")
  points(data$date_time[anomaly_indices], data[[pollutant]][anomaly_indices], col = "red", pch = 20)
  legend("topright", legend = c("Time Series", "Forecast", "Anomalies"), col = c("black", "darkblue", "red"), lty = c(1, 1, 0), pch = c(NA, NA, 20))
}
