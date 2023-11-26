#' Load Pollution Data
#'
#' This function loads pollution data from the package's data directory.
#'
#' @return A data frame containing pollution data.
#' @examples
#' pollution_data <- load_data()
#' print(head(pollution_data))
#' @export
load_data <- function() {
  # Use system.file to locate the CSV file
  data_path <- system.file("extdata", "measur.csv", package = "SAWpollut")
  pollution_data <- read.csv(data_path)
  return(pollution_data)}
#Load pollution data
#data <- load_data()
#Display the first few rows of the dataset
#print(head(data))
