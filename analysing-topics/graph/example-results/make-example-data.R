# make the example data
# by Marcellinus Jerricho
# latest version 02-11-21
s <- matrix(0, nrow = 3, ncol = 500)
s1 <- seq(1, 100, 0.2)
s[1,1:length(s1)] <- s1
s2 <- seq(1, 100, 0.3)
s[2,1:length(s2)] <- s2
s3 <- seq(1, 100, 0.4)
s[3,1:length(s3)] <- s3
View(s)
write.csv(s, file = "example-test.csv", row.names = FALSE, col.names = FALSE)
