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
# Histogram
histogram_plot <- ggplot(data, aes(x = raisedhands)) +
  geom_histogram(aes(y = ..count..), binwidth = 1, colour = "black", fill = "white") +
  stat_function(fun = function(x) dnorm(x, mean = mean(data$raisedhands), sd = sd(data$raisedhands)) * nrow(data), color = "blue") +
  labs(title = "Distribution of Raised Hands in Class",
       x = "Number of Times Raised Hands",
       y = "Frequency") +
  theme_minimal()

print(histogram_plot)
# Close the PDF device
dev.off()
# End of the script