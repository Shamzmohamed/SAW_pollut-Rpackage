#' Location with the Highest Pollutant Concentrations
#'
#' This function takes pre-loaded data and finds the locations with the highest
#' concentrations of specific pollutants.
#'
#' @param file A data frame containing pollutant measurements.
#' @param pollutants A vector of pollutant names for which the highest concentrations are to be determined.
#' @return A list containing pollutant names and their corresponding highest concentration locations.
#'
#' @examples
#' file <- load_data
#' pollutants= c("CO", "SO2", "NO2", "O3")
#' pollu_locs <- highpol(file, pollutants)
#' for (pollutant in pollutants) {
#'   cat("Pollutant:", pollutant, "\n")
#'   cat("Address:", pollu_locs[[pollutant]]$address, "\n\n")
#' }
#'
#' @export
highpol <- function(file, pollutants) {
  # Read the CSV file
  result <- list()  # Initialize the result list
  for (pollutant in pollutants) {
    # Find the row with the highest pollutant concentration
    max_concentration_row <- data[which.max(data[[pollutant]]), ]
    # Extract the address
    address <- max_concentration_row$Address
    # Store the result in the list
    result[[pollutant]] <- list(address = address)}
  return(result)
}
