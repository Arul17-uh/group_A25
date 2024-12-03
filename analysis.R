#!/usr/bin/X11/Rscript
d <- read.csv("xAPI-Edu-Data.csv", header=T, na.strings = c("."))
x <- as.numeric(d$VisITedResources)
y <- as.numeric(d$raisedhands)
# Run the correlation test, which will print to stdout.  You should
# not print anything else; that will confuse the grading script and
# the graders.
# So kendall's r should be OK.
print(cor.test(x, y, method="kendall"))