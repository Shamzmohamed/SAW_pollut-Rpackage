#' Interpolate and plot air quality measurements
#'
#' @param data A data frame containing at least three columns: Longitude, Latitude, and a pollution parameter.
#' @param lon_grid A vector specifying the longitude grid points for interpolation.
#' @param lat_grid A vector specifying the latitude grid points for interpolation.
#' @param param_name The name of the pollution parameter to interpolate and plot.
#' @return NULL
#'
#' @import akima
#' @import graphics
#' @importFrom grDevices rgb
#' @examples
#' data <- load_data()
#' intpol(data, "PM10")
#'
#' @export
intpol <- function(data, param_name) {
  # Define lon_grid and lat_grid based on the range of your data
  lon_grid <- seq(min(data$Longitude), max(data$Longitude), length.out = 100)
  lat_grid <- seq(min(data$Latitude), max(data$Latitude), length.out = 100)
  # Interpolate data
  interpolated_values <- akima::interp(x = data$Longitude, y = data$Latitude, z = data[[param_name]],
                                       xo = lon_grid, yo = lat_grid, duplicate = "mean")
  # Plot interpolated values
  image(lon_grid, lat_grid, interpolated_values$z, main = paste("Interpolated", param_name, "Concentration"),
        xlab = "Longitude", ylab = "Latitude")
  contour(lon_grid, lat_grid, interpolated_values$z, add = TRUE, col = "black")
  points(data$Longitude, data$Latitude, col = "red", pch = 19)
  legend("topright", legend = "Measuring Stations", pch = 19, col = "red")
}
