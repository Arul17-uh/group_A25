# Load required libraries
library(ggplot2)  # Part of the tidyverse, used for creating plots
# Load dataset from current working directory
data <- read.csv("xAPI-Edu-Data.csv")
# Set the output to visualization.pdf
pdf("visualization.pdf")
# Compute and print the correlation coefficient
correlation_coefficient <- cor(data$VisITedResources, data$raisedhands, use = "complete.obs")
cat("Correlation Coefficient between Visited Resources and Raised Hands:", correlation_coefficient, "\n")
# Scatterplot of 'raisedhands' vs 'VisITedResources'
scatter_plot <- ggplot(data, aes(x = VisITedResources, y = raisedhands)) +
  geom_point() +
  geom_smooth(method = "lm", color = "blue") +  # Adds a linear regression line
  labs(title = "Correlation between Visited Resources and Raised Hands",
       x = "Visited Educational Resources",
       y = "Number of Times Raised Hands") +
  theme_minimal()
# Print scatterplot to the PDF
print(scatter_plot)
# Histogram for 'VisITedResources'
histogram_resources <- ggplot(data, aes(x = VisITedResources)) +
  geom_histogram(aes(y = after_stat(density)), binwidth = 1, colour = "black", fill = "white") +
  geom_density(alpha = .2, fill = "#FF6666") +
  labs(title = "Distribution of Visited Educational Resources",
       x = "Visited Educational Resources",
       y = "Density") +
  theme_minimal()
# Print histogram for 'VisITedResources' to the PDF
print(histogram_resources)
# Histogram for 'raisedhands'
histogram_hands <- ggplot(data, aes(x = raisedhands)) +
  geom_histogram(aes(y = after_stat(density)), binwidth = 1, colour = "black", fill = "white") +
  geom_density(alpha = .2, fill = "#FF6666") +
  labs(title = "Distribution of Raised Hands in Class",
       x = "Number of Times Raised Hands",
       y = "Density") +
  theme_minimal()
# Print histogram for 'raisedhands' to the PDF
print(histogram_hands)
# Close the PDF device
dev.off()
# End of the script