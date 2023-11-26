#' Correlation and Regression Analysis with Plotting
#'
#' This function performs correlation and regression analysis between two pollutants and generates a scatter plot with the regression line.
#'
#' @param x Vector containing data for the first pollutant.
#' @param y Vector containing data for the second pollutant.
#' @param pollutant_x Name of the first pollutant.
#' @param pollutant_y Name of the second pollutant.
#'
#' @return Prints correlation and regression results and generates a scatter plot with a regression line.
#'
#' @examples
#' data <- load_data()
#' pollutants <- c("SO2", "NO2", "O3", "CO", "PM10", "PM2.5")
#' correg(data, pollutants)
#'
#' @export
correg <- function(data, pollutants) {
  for (i in 1:(length(pollutants) - 1)) {
    for (j in (i + 1):length(pollutants)) {
      pollutant_x <- pollutants[i]
      pollutant_y <- pollutants[j]

      x <- data[[pollutant_x]]
      y <- data[[pollutant_y]]

      # Calculate means
      mean_x <- mean(x)
      mean_y <- mean(y)

      # Calculate correlation
      numerator_corr <- sum((x - mean_x) * (y - mean_y))
      denominator_corr <- sqrt(sum((x - mean_x)^2) * sum((y - mean_y)^2))
      correlation <- numerator_corr / denominator_corr

      # Calculate regression
      numerator_reg <- sum((x - mean_x) * (y - mean_y))
      denominator_reg <- sum((x - mean_x)^2)
      slope <- numerator_reg / denominator_reg
      intercept <- mean_y - slope * mean_x

      # Print results
      cat("Correlation between", pollutant_x, "and", pollutant_y, ":", correlation, "\n")
      cat("Regression equation: y =", slope, "* x +", intercept, "\n")

      # Plot the data and regression line
      plot(x, y, main = paste("Scatter Plot and Regression Line for", pollutant_x, "and", pollutant_y),
           xlab = pollutant_x, ylab = pollutant_y, pch = 19, col = "blue")
      abline(a = intercept, b = slope, col = "red")
    }
  }
}
