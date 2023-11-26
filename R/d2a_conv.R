#' Daily to Annual Pollution Conversion
#'
#' The function can be used to convert daily pollution values to annual values.
#'
#' @param data A data frame containing pollution data.
#' @param date Column name which contains date in year-month-day format.
#' @param pollutants Vector of pollutant names for analysis.
#'
#' @return A data frame with annual average pollutant levels.
#'
#' @examples
#' data <- load_data()
#' pollutants <- c("SO2", "NO2", "O3", "CO", "PM10", "PM2.5")
#' d2a_conv(data = data, date = "Date", pollutants = pollutants)
#'
#' @importFrom lubridate year
#' @export
d2a_conv <- function(data, date, pollutants) {
  # Convert the date column to Date object
  data$Date <- as.Date(data[[date]], format = "%m/%d/%Y %H:%M")
  # Extract year from date
  data$Year <- lubridate::year(data$Date)
  # Calculate annual average pollutant levels
  annual_data <- aggregate(data[, pollutants], by = list(data$Year), FUN = mean, na.rm = TRUE)
  colnames(annual_data)[1] <- "Year"
  return(annual_data)
}
