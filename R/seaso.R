#' Seasonal Analysis on Pollutant Data
#'
#' This function performs longitudinal analysis on pollutant data by calculating
#' the average levels of specified pollutants for each year and season, and
#' generating bar plots to visualize the results.
#'
#' @param data A data frame containing pollutant measurements with a "Date"
#'             column and columns for each pollutant.
#' @param pollutants A character vector specifying the pollutants to analyze.
#'
#' @return A data frame containing the calculated average pollutant levels for
#'         each year and season.
#'
#' @examples
#' data <- load_data()
#' pollutants <- c("SO2", "NO2", "O3", "CO", "PM10", "PM2.5")
#' season_results <- seaso(data, pollutants)
#' print(season_results)
#'
#' @export
seaso <- function(data, pollutants) {
  # Convert the "Date" column to a Date object
  data$Date <- as.Date(data$Date, format = "%m/%d/%Y %H:%M")
  # Extract year and season information
  data$Year <- format(data$Date, "%Y")
  data$Month <- as.integer(format(data$Date, "%m"))
  # Define seasons based on months
  data$Season <- ifelse(data$Month %in% c(3, 4, 5), "Spring",
                        ifelse(data$Month %in% c(6, 7, 8), "Summer",
                               ifelse(data$Month %in% c(9, 10, 11), "Fall", "Winter")))
  # Initialize an empty data frame to store results
  result_df <- data.frame(Year = numeric(0), Season = character(0))
  for (pollutant in pollutants) {
    # Calculate average pollutant levels for each year and season
    avg_levels <- aggregate(data[[pollutant]], by = list(data$Year, data$Season), mean, na.rm = TRUE)
    colnames(avg_levels) <- c("Year", "Season", paste0(pollutant, "_Avg"))

    # Merge the results into the main data frame
    result_df <- merge(result_df, avg_levels, by = c("Year", "Season"), all = TRUE)
  }

  # Plotting
  for (pollutant in pollutants) {
    pollutant_col <- grep(paste0(pollutant, "_Avg"), colnames(result_df))
    plot_title <- paste("Average", pollutant, "Levels Over Years and Seasons")
    barplot(result_df[, pollutant_col], beside = TRUE,
            names.arg = paste(result_df$Year, result_df$Season, sep = " - "),
            main = plot_title, ylab = "Average Level", xlab = "Year - Season")
  }
  return(result_df)
}
