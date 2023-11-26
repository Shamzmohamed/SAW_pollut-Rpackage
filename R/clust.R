#' Cluster Analysis of Pollutant Profiles
#'
#' This function performs cluster analysis on pollutant profiles using either k-means or hierarchical clustering.
#'
#' @param data Data frame containing pollutant profiles for stations. Columns must include pollutants.
#' @param pollutants Vector of pollutant names for analysis.
#' @param method Clustering method to use ("kmeans" or "hclust").
#' @param k Number of clusters (for k-means method).
#'
#' @return Prints cluster results and generates a dendrogram or cluster plot based on the chosen method.
#'
#' @examples
#' data <- load_data()
#' pollutants <- c("PM10", "PM2.5")
#' clust(data, pollutants, method = "kmeans", k = 4)
#'
#' @export
clust <- function(data, pollutants, method = "kmeans", k = 3) {
  # Extract selected pollutants from the data
  pollutant_data <- data[, pollutants]
  if (method == "kmeans") {
    # Perform k-means clustering
    clusters <- kmeans(pollutant_data, centers = k)
    # Plot cluster plot
    if (length(unique(clusters$cluster)) > 1) {
      cluster_colors <- rainbow(length(unique(clusters$cluster)))
      cluster_labels <- factor(clusters$cluster)
      plot(pollutant_data, col = cluster_colors[cluster_labels], pch = 19,
           main = "Cluster Plot of Pollutant Profiles")
      legend("topright", legend = levels(cluster_labels), col = cluster_colors, pch = 19)
    } else {
      cat("Cannot plot cluster plot with only one cluster.\n")
    }
  } else {
    cat("Invalid clustering method. Use 'kmeans'.\n")
  }
}
