# making graph
# by marcellinus jerricho
# version 07-11-21

# import library  ---------------------------------------------------------------
library("dplyr") 
library("ggplot2")

# setting up data --------------------------------------------------------------
data <- t(read.csv("timestamp.csv", header = FALSE))
View(data)
len <- 100 # number of calls to look at

# set up index, x minimum and maximum
index <- seq(1, ncol(data), 1)
xlim <- c(1427157864, 1427157867)

# Drawing graph individually with limit in x-axis
help(png)
png('timestamp-graph.png', width = 1000, height = 600, units="px")
plot(x=data[1:len,1], xlim = xlim, 
     y = rep(index[1], len), ylim = c(1, ncol(data)),
     xlab = "timestamp (s)", ylab = "index") 
for (i in 2:length(index)) {
  points(x = data[1:len, i], y = rep(index[i], len), pch = 6)
}
grid(10, NULL, lty = 2)
dev.off()


# using ggplot without limit in x-axis
for (i in 2:ncol(data)) {
  print(i)
}
help(ggplot)
ggplot() + 
  scale_shape_manual(values = 12) +
  geom_point(aes(x = data[1:len, 1], y = rep(1, len))) + 
  geom_point(aes(x = data[1:len, 2], y = rep(1.1, len))) + 
  geom_point(aes(x = data[1:len, 3], y = rep(1.2, len)))
  
