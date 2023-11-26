#' Create a Matrix Plot for Pollutant Data
#'
#' This function creates a matrix plot to visualize the relationships between pollutants.
#'
#' @param data A data frame containing the pollutant data.
#' @param pollutants A vector of pollutant names to include in the matrix plot.
#'
#' @return A matrix plot.
#'
#' @examples
#' data <- load_data()
#' pollutants <- c("SO2", "NO2", "O3", "CO", "PM10", "PM2.5")
#' matriplot(data, pollutants)
#'
#' @export
matriplot <- function(data, pollutants) {
  # Select the specified pollutants columns
  selected_data <- data[, c("Date", pollutants)]
  # Calculate the correlation matrix
  correlation_matrix <- cor(selected_data[, pollutants], use = "complete.obs")

  # Create a matrix plot using base R plotting functions
  n <- ncol(correlation_matrix)
  plot(1:n, 1:n, type = "n", xlab = "", ylab = "", xlim = c(0.5, n + 0.5), ylim = c(0.5, n + 0.5))
  text(expand.grid(1:n, 1:n), labels = round(correlation_matrix, 2), col = "black", cex = 0.8)
  axis(1, at = 1:n, labels = pollutants, las = 2, tick = FALSE, line = -0.5)
  axis(2, at = 1:n, labels = pollutants, las = 2, tick = FALSE, line = -0.5, las = 2)
  title(main = "Correlation Matrix of Pollutants", xlab = "Pollutants", ylab = "Pollutants")
}
