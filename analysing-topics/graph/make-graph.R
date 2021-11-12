# making graph from Autoware topics
# by marcellinus jerricho
# version 10-11-21

# Getting data -----------------------------------------------------------------
args <- commandArgs(TRUE)
data <- t(read.csv(args[1], header = FALSE, row.names = 1))
#data <- t(read.csv("timestamp.csv", header = FALSE, row.names = 1))

# Preparing data and graph -----------------------------------------------------
# Set the number of calls to look at - UPDATE AS NEEDED!
len <- 100

# set up index 
index <- seq(1, ncol(data), 1)
#x minimum and maximum - THIS NEEDS TO BE UPDATED!
xlim <- c(1427157864, 1427157867)

# Generate graph individually with limit in x-axis and save it as png ----------
png('timestamp-graph.png', width = 1000, height = 600, units="px")
plot(x=data[1:len,1], xlim = xlim, 
     y = rep(index[1], len), ylim = c(1, ncol(data)),
     xlab = "timestamp (s)", ylab = "index") 
for (i in 2:length(index)) {
  points(x = data[1:len, i], y = rep(index[i], len), pch = 6)
}
grid(NULL, NULL)
dev.off()

# create an index of the topic for reference and save it as csv ----------------
topics <- colnames(data)
indexed_topics <- data.frame(index = seq.int(1, length(topics)), 
                             topics = topics)
write.csv(indexed_topics, "index-topics.csv", row.names = FALSE)
